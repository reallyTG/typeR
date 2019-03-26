library(safer)


### Name: encrypt_string
### Title: Encrypt a string
### Aliases: encrypt_string

### ** Examples

# symmetric case:
temp <- encrypt_string("hello, how are you", key = "secret")
all(
  is.character(temp)
  , decrypt_string(temp, "secret") == "hello, how are you"
  , class(try(decrypt_string(temp, "nopass"), silent = TRUE)) == "try-error"
  )

# string encoded as raw
res <- encrypt_string("tatvamasi", ascii = FALSE)
res

isTRUE(identical(decrypt_string(res), "tatvamasi"))

# asymmetric case:
alice <- keypair()
bob   <- keypair()
temp  <- encrypt_string("hello asymmetric", alice$private_key, bob$public_key)
temp2 <- decrypt_string(temp, bob$private_key, alice$public_key)
identical("hello asymmetric", temp2)




