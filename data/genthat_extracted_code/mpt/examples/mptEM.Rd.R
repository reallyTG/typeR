library(mpt)


### Name: mptEM
### Title: EM Algorithm for Multinomial Processing Tree Models
### Aliases: mptEM
### Keywords: models

### ** Examples

## Fit storage-retrieval model to data in Riefer et al. (2002)
spec <- mptspec("SR2")
mpt1 <- mpt(spec, c(243, 64, 58, 55), method = "EM")



