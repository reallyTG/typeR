library(openssl)


### Name: fingerprint
### Title: OpenSSH fingerprint
### Aliases: fingerprint

### ** Examples

mykey <- rsa_keygen()
pubkey <- as.list(mykey)$pubkey
fingerprint(mykey)
fingerprint(pubkey)

# Some systems use other hash functions
fingerprint(pubkey, sha1)
fingerprint(pubkey, sha256)

# Other key types
fingerprint(dsa_keygen())



