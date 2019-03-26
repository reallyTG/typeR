library(spec)


### Name: write.spec
### Title: Write Specification to Storage
### Aliases: write.spec

### ** Examples

data(drug)
file <- tempfile()
spec <- specification(drug, tol = 3)
write.spec(spec, file = file)



