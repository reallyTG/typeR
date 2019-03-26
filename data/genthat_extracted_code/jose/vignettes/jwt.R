## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
knitr::opts_chunk$set(comment = "")

## ------------------------------------------------------------------------
library(openssl)
library(jose)

# Example payload
claim <- jwt_claim(user = "jeroen", session_key = 123456)

# Encode with hmac
key <- charToRaw("SuperSecret")
(jwt <- jwt_encode_hmac(claim, secret = key))

# Decode 
jwt_decode_hmac(jwt, secret = key)

## ----error=TRUE----------------------------------------------------------
# What happens if we decode with the wrong key
jwt_decode_hmac(jwt, secret = raw())

## ------------------------------------------------------------------------
# Generate ECDSA keypair
key <- ec_keygen()
pubkey <- as.list(key)$pubkey

# Sign with the private key
(jwt <- jwt_encode_sig(claim, key = key))

# Decode and verify using the public key
jwt_decode_sig(jwt, pubkey = pubkey)

## ----error = TRUE--------------------------------------------------------
wrong_key <- ec_keygen()
jwt_decode_sig(jwt, pubkey = wrong_key)

## ------------------------------------------------------------------------
(strings <- strsplit(jwt, ".", fixed = TRUE)[[1]])
cat(rawToChar(base64url_decode(strings[1])))
cat(rawToChar(base64url_decode(strings[2])))

