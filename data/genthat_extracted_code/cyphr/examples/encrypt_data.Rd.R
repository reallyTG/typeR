library(cyphr)


### Name: encrypt_data
### Title: Encrypt and decrypt data and other things
### Aliases: encrypt_data encrypt_object encrypt_string encrypt_file
###   decrypt_data decrypt_object decrypt_string decrypt_file

### ** Examples

key <- key_sodium(sodium::keygen())
# Some super secret data we want to encrypt:
x <- runif(10)
# Convert the data into a raw vector:
data <- serialize(x, NULL)
data
# Encrypt the data; without the key above we will never be able to
# decrypt this.
data_enc <- encrypt_data(data, key)
data_enc
# Our random numbers:
unserialize(decrypt_data(data_enc, key))
# Same as the never-encrypted version:
x

# This can be achieved more easily using `encrypt_object`:
data_enc <- encrypt_object(x, key)
identical(decrypt_object(data_enc, key), x)

# Encrypt strings easily:
str_enc <- encrypt_string("secret message", key)
str_enc
decrypt_string(str_enc, key)



