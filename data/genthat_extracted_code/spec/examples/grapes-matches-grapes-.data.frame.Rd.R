library(spec)


### Name: %matches%.data.frame
### Title: Check Whether Data Frame matches Spec
### Aliases: %matches%.data.frame matches

### ** Examples

data(drug)
file <- tempfile()
spec <- specification(drug, tol = 3)
write.spec(spec, file = file)
drug %matches% spec



