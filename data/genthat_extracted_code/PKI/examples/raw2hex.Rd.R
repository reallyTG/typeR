library(PKI)


### Name: raw2hex
### Title: Convert raw vector to string hex representation
### Aliases: raw2hex
### Keywords: manip

### ** Examples

raw2hex(PKI.digest(raw(), "SHA1"), "")
raw2hex(PKI.digest(raw(), "MD5"), ":")

## this is jsut a performance comparison and a test that
## raw2hex can handle long strings
x <- as.raw(runif(1e5) * 255.9)
system.time(h1 <- raw2hex(x, " "))
system.time(h2 <- paste(raw2hex(x), collapse=" "))
stopifnot(identical(h1, h2))



