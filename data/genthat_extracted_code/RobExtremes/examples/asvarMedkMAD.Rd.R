library(RobExtremes)


### Name: asvarMedkMAD
### Title: Function to compute asymptotic variance of MedkMAD estimator
### Aliases: asvarMedkMAD
### Keywords: asymptotic variance

### ** Examples

GP <- GParetoFamily(scale=1,shape=0.7)
asvarMedkMAD(GP,k=1)

## for didactical purposes turn GP into a non-GPD
setClass("noGP",contains="L2ScaleShapeUnion")
GP2 <- GP
class(GP2) <- "noGP"
asvarMedkMAD(GP2,k=1) ### uses numerical integration



