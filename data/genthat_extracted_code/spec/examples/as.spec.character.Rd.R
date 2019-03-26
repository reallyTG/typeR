library(spec)


### Name: as.spec.character
### Title: Coerce to Specification from Character
### Aliases: as.spec.character

### ** Examples

data(drug)
file <- tempfile()
spec <- specification(drug, tol = 3)
write.spec(spec, file = file)
as.spec(file)



