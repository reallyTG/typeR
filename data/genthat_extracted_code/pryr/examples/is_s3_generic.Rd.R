library(pryr)


### Name: is_s3_generic
### Title: Determine if a function is an S3 generic or S3 method.
### Aliases: is_s3_generic is_s3_method
### Keywords: internal

### ** Examples

is_s3_generic("mean")
is_s3_generic("sum")
is_s3_generic("[[")
is_s3_generic("unlist")
is_s3_generic("runif")

is_s3_method("t.data.frame")
is_s3_method("t.test") # Just tricking!
is_s3_method("as.data.frame")
is_s3_method("mean.Date")



