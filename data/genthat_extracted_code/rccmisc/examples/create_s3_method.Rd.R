library(rccmisc)


### Name: create_s3_method
### Title: Template functions to generate basic S3 methods for new classes
### Aliases: create_s3_method create_s3_print

### ** Examples

a <- structure(1:10, class = c("b", "numeric"))
a[3] # Normal subsetting makes a loose its attributes
`[.b` <- create_s3_method("[")
print.b <- create_s3_print(as.numeric)
a[3] # attributes preserved even if we can't see them
str(a[3])




