library(openssl)


### Name: signature_create
### Title: Signatures
### Aliases: signature_create signature_verify ecdsa_parse ecdsa_write

### ** Examples

# Generate a keypair
key <- rsa_keygen()
pubkey <- key$pubkey

# Sign a file
data <- system.file("DESCRIPTION")
sig <- signature_create(data, key = key)
stopifnot(signature_verify(data, sig, pubkey = pubkey))

# Sign raw data
data <- serialize(iris, NULL)
sig <- signature_create(data, sha256, key = key)
stopifnot(signature_verify(data, sig, sha256, pubkey = pubkey))

# Sign a hash
md <- md5(data)
sig <- signature_create(md, hash = NULL, key = key)
stopifnot(signature_verify(md, sig, hash = NULL, pubkey = pubkey))
#
# ECDSA example
data <- serialize(iris, NULL)
key <- ec_keygen()
pubkey <- key$pubkey
sig <- signature_create(data, sha256, key = key)
stopifnot(signature_verify(data, sig, sha256, pubkey = pubkey))

# Convert signature to (r, s) parameters and then back
params <- ecdsa_parse(sig)
out <- ecdsa_write(params$r, params$s)
identical(sig, out)



