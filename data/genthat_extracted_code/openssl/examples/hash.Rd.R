library(openssl)


### Name: hashing
### Title: Vectorized hash/hmac functions
### Aliases: hashing sha1 hmac mac sha224 sha256 sha384 sha512 sha2 md4 md5
###   blake2b blake2s ripemd160

### ** Examples

# Support both strings and binary
md5(c("foo", "bar"))
md5("foo", key = "secret")

hash <- md5(charToRaw("foo"))
as.character(hash, sep = ":")

# Compare to digest
digest::digest("foo", "md5", serialize = FALSE)

# Other way around
digest::digest(cars, skip = 0)
md5(serialize(cars, NULL))

# Stream-verify from connections (including files)
myfile <- system.file("CITATION")
md5(file(myfile))
md5(file(myfile), key = "secret")

## Not run: 
##D check md5 from: http://cran.r-project.org/bin/windows/base/old/3.1.1/md5sum.txt
##D md5(url("http://cran.r-project.org/bin/windows/base/old/3.1.1/R-3.1.1-win.exe"))
## End(Not run)

# Use a salt to prevent dictionary attacks
sha1("admin") # googleable
sha1("admin", key = "random_salt_value") #not googleable

# Use a random salt to identify duplicates while anonymizing values
sha256("john") # googleable
sha256(c("john", "mary", "john"), key = "random_salt_value")



