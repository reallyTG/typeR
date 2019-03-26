library(jsonlite)


### Name: base64
### Title: Encode/decode base64
### Aliases: base64 base64_dec base64_enc

### ** Examples

str <- base64_enc(serialize(iris, NULL))
out <- unserialize(base64_dec(str))
stopifnot(identical(out, iris))



