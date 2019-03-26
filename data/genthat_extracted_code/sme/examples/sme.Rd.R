library(sme)


### Name: sme
### Title: Smoothing-splines mixed-effects models
### Aliases: sme sme.default

### ** Examples

  data(MTB)
  fit.AIC <- sme(MTB[MTB$variable==6031,c("y","tme","ind")],criteria="AIC")
  fit.BICN <- sme(MTB[MTB$variable==6031,c("y","tme","ind")],criteria="BICN")
  fit.BICn <- sme(MTB[MTB$variable==6031,c("y","tme","ind")],criteria="BICn")
  fit.AICc <- sme(MTB[MTB$variable==6031,c("y","tme","ind")],criteria="AICc")

  fit <- sme(MTB[MTB$variable==6031,c("y","tme","ind")],lambda.mu=1e5,lambda.v=1e5)

  data(inflammatory)
  system.time(fit <- sme(inflammatory,knots=c(29.5,57,84.5),deltaEM=0.1,deltaNM=0.1))



