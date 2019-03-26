library(sme)


### Name: getRoughnessMatrix
### Title: Extract the roughness matrix used in an SME model fit
### Aliases: getRoughnessMatrix

### ** Examples

  data(MTB)
  fit <- sme(MTB[MTB$variable==6031,c("y","tme","ind")])
  getRoughnessMatrix(fit)



