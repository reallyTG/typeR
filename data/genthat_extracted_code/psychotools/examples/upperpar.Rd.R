library(psychotools)


### Name: upperpar
### Title: Extract Upper Asymptote Parameters of Item Response Models
### Aliases: upperpar upperpar.raschmodel upperpar.rsmodel upperpar.pcmodel
###   upperpar.plmodel upperpar.gpcmodel coef.upperpar print.upperpar
###   vcov.upperpar
### Keywords: classes

### ** Examples

if(requireNamespace("mirt")) {

o <- options(digits = 3)

## load simulated data
data("Sim3PL", package = "psychotools")

## fit 2PL to data simulated under the 3PLu
twoplmod <- plmodel(Sim3PL$resp2)

## extract the upper asymptote parameters (all fixed at 1)
up1 <- upperpar(twoplmod)

## fit 3PLu to data simulated under the 3PLu
threeplmodu <- plmodel(Sim3PL$resp2, type = "3PLu")

## extract the upper asymptote parameters
up2 <- upperpar(threeplmodu)

## extract the standard errors
sqrt(diag(vcov(up2)))

## extract the upper asymptote parameters on the logit scale
up2_logit <- upperpar(threeplmodu, logit = TRUE)

## along with the delta transformed standard errors
sqrt(diag(vcov(up2_logit)))

options(digits = o$digits)
}



