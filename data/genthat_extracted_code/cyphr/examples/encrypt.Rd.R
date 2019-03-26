library(cyphr)


### Name: encrypt
### Title: Easy encryption and decryption
### Aliases: encrypt decrypt encrypt_ decrypt_

### ** Examples

# To do anything we first need a key:
key <- cyphr::key_sodium(sodium::keygen())

# Encrypted write.csv - note how any number of arguments to
# write.csv will be passed along
path <- tempfile(fileext = ".csv")
cyphr::encrypt(write.csv(iris, path, row.names = FALSE), key)

# The new file now exists
file.exists(path)

# ...but it cannot be read with read.csv!
try(read.csv(path, stringsAsFactors = FALSE))

# Wrap the read.csv call with cyphr::decrypt()
dat <- cyphr::decrypt(read.csv(path, stringsAsFactors = FALSE), key)
head(dat)

file.remove(path)

# If you have a function that is not supported you can specify the
# filename argument directly.  For example, with "write.dcf" the
# filename argument is called "file"; we can pass that along
path <- tempfile()
cyphr::encrypt(write.dcf(list(a = 1), path), key, file_arg = "file")

# Similarly for decryption:
cyphr::decrypt(read.dcf(path), key, file_arg = "file")



