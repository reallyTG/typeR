library(spec)


### Name: %matches%.spec
### Title: Check Whether Spec matches Dataset
### Aliases: %matches%.spec
### Keywords: internal

### ** Examples

data(drug)
file <- tempfile()
spec <- specification(drug, tol = 3)
write.spec(spec, file = file)
spec %matches% drug



