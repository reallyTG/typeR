library(httpuv)


### Name: rawToBase64
### Title: Convert raw vector to Base64-encoded string
### Aliases: rawToBase64

### ** Examples

set.seed(100)
result <- rawToBase64(as.raw(runif(19, min=0, max=256)))
stopifnot(identical(result, "TkGNDnd7z16LK5/hR2bDqzRbXA=="))




