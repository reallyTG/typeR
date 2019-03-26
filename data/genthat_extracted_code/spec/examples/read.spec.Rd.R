library(spec)


### Name: read.spec
### Title: Read Specification from File
### Aliases: read.spec

### ** Examples

data(drug)
file <- tempfile()
spec <- specification(drug, tol = 3)
write.spec(spec, file = file)
read.spec(file)



