library(spec)


### Name: %matches%.character
### Title: Check Whether Character matches y
### Aliases: %matches%.character

### ** Examples

data(drug)
file <- tempfile()
spec <- specification(drug, tol = 3)
library(csv)
as.csv(drug, file)
file %matches% spec



