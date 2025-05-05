{
  fetchFromGitHub,
  fetchpatch,
  stdenv,
  lib,
}:
stdenv.mkDerivation rec {
  pname = "cowfetch";
  version = "1.0.1";

  src = fetchFromGitHub {
    owner = "bradeythedev";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-CQbU44qx4YLZVZyKz3Ho2lmcGjZ7YoDJZU8xXrI2YCQ=";
  };

  patches = [
    (fetchpatch {
      url = "https://patch-diff.githubusercontent.com/raw/bradeythedev/cowfetch/pull/1.patch";
      sha256 = "sha256-54wTbut4DxUxZSoShxWze4IB0tkhPK2lUfmr6JbMBzg=";
    })
  ];

  installPhase = ''
    mkdir -p $out/bin/
    PREFIX="$out" make install
  '';

  meta = with lib; {
    description = "Fetch program with a cow";
    homepage = "https://github.com/bradeythedev/cowfetch";
    license = licenses.gpl3;
    maintainers = [ ];
    broken = stdenv.isDarwin;
  };
}
