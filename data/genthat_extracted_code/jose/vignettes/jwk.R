## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
knitr::opts_chunk$set(comment = "")

## ------------------------------------------------------------------------
library(openssl)
library(jose)

# Generate a ECDSA key
key <- openssl::ec_keygen()
jsonlite::prettify(write_jwk(key))

# Use public key
pubkey <- as.list(key)$pubkey
json <- write_jwk(pubkey)
jsonlite::prettify(json)

# Read JWK key
(out <- read_jwk(json))
identical(pubkey, out)

## ------------------------------------------------------------------------
# Random secret
(key <- rand_bytes(16))
(jwk <- write_jwk(key))
read_jwk(jwk)

