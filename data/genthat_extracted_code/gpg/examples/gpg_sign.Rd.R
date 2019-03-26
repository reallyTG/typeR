library(gpg)


### Name: gpg_sign
### Title: PGP Signatures
### Aliases: gpg_sign gpg_verify gpg

### ** Examples

# This requires you have the Debian master key in your keyring
msg <- tempfile()
sig <- tempfile()
download.file("http://http.us.debian.org/debian/dists/jessie/Release", msg)
download.file("http://http.us.debian.org/debian/dists/jessie/Release.gpg", sig)
gpg_verify(sig, msg, error = FALSE)



