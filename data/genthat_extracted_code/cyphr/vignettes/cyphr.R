## ------------------------------------------------------------------------
k <- openssl::aes_keygen()

## ------------------------------------------------------------------------
k

## ------------------------------------------------------------------------
key <- cyphr::key_openssl(k)
key

## ------------------------------------------------------------------------
secret <- cyphr::encrypt_string("my secret string", key)

## ------------------------------------------------------------------------
cyphr::decrypt_string(secret, key)

## ------------------------------------------------------------------------
k <- sodium::keygen()

## ------------------------------------------------------------------------
key <- cyphr::key_sodium(k)
key

## ------------------------------------------------------------------------
path_key_alice <- cyphr::ssh_keygen(password = FALSE)
path_key_bob <- cyphr::ssh_keygen(password = FALSE)

## ------------------------------------------------------------------------
dir(path_key_alice)
dir(path_key_bob)

## ------------------------------------------------------------------------
pair_a <- cyphr::keypair_openssl(path_key_bob, path_key_alice)
pair_a

## ------------------------------------------------------------------------
secret <- cyphr::encrypt_string("secret message", pair_a)

## ------------------------------------------------------------------------
secret

## ----error = TRUE--------------------------------------------------------
cyphr::decrypt_string(secret, pair_a)

## ------------------------------------------------------------------------
pair_b <- cyphr::keypair_openssl(path_key_alice, path_key_bob)

## ------------------------------------------------------------------------
cyphr::decrypt_string(secret, pair_b)

## ------------------------------------------------------------------------
secret2 <- cyphr::encrypt_string("another message", pair_b)
secret2

## ------------------------------------------------------------------------
cyphr::decrypt_string(secret2, pair_a)

## ------------------------------------------------------------------------
secret <- cyphr::encrypt_string("secret message", pair_a)
path_for_bob <- file.path(tempdir(), "for_bob_only")
writeBin(secret, path_for_bob)

## ------------------------------------------------------------------------
secret <- readBin(path_for_bob, raw(), file.size(path_for_bob))
cyphr::decrypt_string(secret, pair_b)

## ------------------------------------------------------------------------
secret_base64 <- openssl::base64_encode(secret)
secret_base64

## ------------------------------------------------------------------------
identical(openssl::base64_decode(secret_base64), secret)

## ------------------------------------------------------------------------
secret_hex <- sodium::bin2hex(secret)
secret_hex

## ------------------------------------------------------------------------
identical(sodium::hex2bin(secret_hex), secret)

## ------------------------------------------------------------------------
key_a <- sodium::keygen()
pub_a <- sodium::pubkey(key_a)

## ------------------------------------------------------------------------
key_b <- sodium::keygen()
pub_b <- sodium::pubkey(key_b)

## ------------------------------------------------------------------------
pair_a <- cyphr::keypair_sodium(pub_b, key_a)

## ------------------------------------------------------------------------
secret <- cyphr::encrypt_string("secret message", pair_a)
secret

## ------------------------------------------------------------------------
pair_b <- cyphr::keypair_sodium(pub_a, key_b)
cyphr::decrypt_string(secret, pair_b)

## ------------------------------------------------------------------------
key <- cyphr::key_sodium(sodium::keygen())

## ------------------------------------------------------------------------
obj <- list(x = 1:10, y = "secret")

## ------------------------------------------------------------------------
secret <- cyphr::encrypt_object(obj, key)
secret

## ------------------------------------------------------------------------
cyphr::decrypt_object(secret, key)

## ------------------------------------------------------------------------
path_secret <- file.path(tempdir(), "secret.rds")
cyphr::encrypt_object(obj, key, path_secret)

## ------------------------------------------------------------------------
file.exists(path_secret)

## ----error = TRUE--------------------------------------------------------
readRDS(path_secret)

## ------------------------------------------------------------------------
cyphr::decrypt_object(path_secret, key)

## ------------------------------------------------------------------------
secret <- cyphr::encrypt_string("secret", key)
secret

## ------------------------------------------------------------------------
cyphr::decrypt_string(secret, key)

## ------------------------------------------------------------------------
dat <- sodium::random(100)
dat # some random bytes

secret <- cyphr::encrypt_data(dat, key)
secret

## ------------------------------------------------------------------------
identical(cyphr::decrypt_data(secret, key), dat)

## ------------------------------------------------------------------------
path_data_csv <- file.path(tempdir(), "iris.csv")
write.csv(iris, path_data_csv, row.names = FALSE)

## ------------------------------------------------------------------------
path_data_enc <- file.path(tempdir(), "iris.csv.enc")
cyphr::encrypt_file(path_data_csv, key, path_data_enc)

## ------------------------------------------------------------------------
path_data_decrypted <- file.path(tempdir(), "idis2.csv")
cyphr::decrypt_file(path_data_enc, key, path_data_decrypted)

## ------------------------------------------------------------------------
tools::md5sum(c(path_data_csv, path_data_decrypted))

## ------------------------------------------------------------------------
key <- cyphr::key_sodium(sodium::keygen())
x <- list(a = 1:10, b = "don't tell anyone else")

## ------------------------------------------------------------------------
path_object <- file.path(tempdir(), "secret.rds")
cyphr::encrypt(saveRDS(x, path_object), key)

## ----error = TRUE--------------------------------------------------------
readRDS(path_object)

## ------------------------------------------------------------------------
cyphr::decrypt(readRDS(path_object), key)

## ------------------------------------------------------------------------
cyphr::encrypt_(quote(saveRDS(x, path_object)), key)
cyphr::decrypt_(quote(readRDS(path_object)), key)

## ------------------------------------------------------------------------
key <- cyphr::key_sodium(sodium::keygen())

## ------------------------------------------------------------------------
secret <- cyphr::encrypt_string("my secret", key)

## ------------------------------------------------------------------------
cyphr::decrypt_string(secret, key)

## ------------------------------------------------------------------------
cyphr::session_key_refresh()

## ----error = TRUE--------------------------------------------------------
cyphr::decrypt_string(secret, key)

## ----include = FALSE-----------------------------------------------------
unlink(c(path_secret, path_object, path_data_csv, path_data_enc,
         path_data_decrypted, path_for_bob,
         path_key_alice, path_key_bob),
       recursive = TRUE)

