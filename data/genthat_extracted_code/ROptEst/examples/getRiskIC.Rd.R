library(ROptEst)


### Name: getRiskIC
### Title: Generic function for the computation of a risk for an IC
### Aliases: getRiskIC getRiskIC-methods
###   getRiskIC,HampIC,asCov,missing,missing-method
###   getRiskIC,HampIC,asCov,missing,L2ParamFamily-method
###   getRiskIC,TotalVarIC,asCov,missing,L2ParamFamily-method
### Keywords: robust

### ** Examples

B <- BinomFamily(size = 25, prob = 0.25)

## classical optimal IC
IC0 <- optIC(model = B, risk = asCov())
getRiskIC(IC0, asCov())



