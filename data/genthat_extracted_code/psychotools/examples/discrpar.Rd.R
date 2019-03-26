library(psychotools)


### Name: discrpar
### Title: Extract Discrimination Parameters of Item Response Models
### Aliases: discrpar discrpar.raschmodel discrpar.rsmodel discrpar.pcmodel
###   discrpar.plmodel discrpar.gpcmodel coef.discrpar print.discrpar
###   vcov.discrpar
### Keywords: classes

### ** Examples

o <- options(digits = 4)

## load verbal aggression data
data("VerbalAggression", package = "psychotools")

## fit Rasch model to verbal aggression data
rmod <- raschmodel(VerbalAggression$resp2)

## extract the discrimination parameters
dp1 <- discrpar(rmod)

## extract the standard errors
sqrt(diag(vcov(dp1)))

if(requireNamespace("mirt")) {
## fit 2PL to verbal aggression data
twoplmod <- plmodel(VerbalAggression$resp2)

## extract the discrimination parameters
dp2 <- discrpar(twoplmod)

## this time with the first discrimination parameter being the reference
discrpar(twoplmod, ref = 1)

## extract the standard errors
sqrt(diag(vcov(dp2)))
}

options(digits = o$digits)



