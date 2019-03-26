library(jose)


### Name: jwt_encode_hmac
### Title: JSON Web Token
### Aliases: jwt_encode_hmac jwt jose jwt_decode_hmac jwt_encode_sig
###   jwt_decode_sig

### ** Examples

# HMAC signing
mysecret <- "This is super secret"
token <- jwt_claim(name = "jeroen", session = 123456)
sig <- jwt_encode_hmac(token, mysecret)
jwt_decode_hmac(sig, mysecret)

# RSA encoding
mykey <- openssl::rsa_keygen()
pubkey <- as.list(mykey)$pubkey
sig <- jwt_encode_sig(token, mykey)
jwt_decode_sig(sig, pubkey)

# Same with EC
mykey <- openssl::ec_keygen()
pubkey <- as.list(mykey)$pubkey
sig <- jwt_encode_sig(token, mykey)
jwt_decode_sig(sig, pubkey)



