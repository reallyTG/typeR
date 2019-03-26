library(sloop)


### Name: s3_dispatch
### Title: Illustrate S3 dispatch
### Aliases: s3_dispatch

### ** Examples

x <- Sys.time()
s3_dispatch(print(x))
s3_dispatch(is.numeric(x))
s3_dispatch(as.Date(x))
s3_dispatch(sum(x))

# Internal vs. regular generic
x1 <- 1
x2 <- structure(2, class = "double")

my_length <- function(x) UseMethod("my_length")
s3_dispatch(my_length(x1))
s3_dispatch(my_length(x2))

s3_dispatch(length(x1))
s3_dispatch(length(x2))



