library(psychotools)


### Name: guesspar
### Title: Extract Guessing Parameters of Item Response Models
### Aliases: guesspar guesspar.raschmodel guesspar.rsmodel guesspar.pcmodel
###   guesspar.plmodel guesspar.gpcmodel coef.guesspar print.guesspar
###   vcov.guesspar
### Keywords: classes

### ** Examples

if(requireNamespace("mirt")) {

o <- options(digits = 3)

## load simulated data
data("Sim3PL", package = "psychotools")

## fit 2PL to data simulated under the 3PL
twoplmod <- plmodel(Sim3PL$resp)

## extract the guessing parameters (all fixed at 0)
gp1 <- guesspar(twoplmod)

## fit 3PL to data simulated under the 3PL
threeplmod <- plmodel(Sim3PL$resp, type = "3PL")

## extract the guessing parameters
gp2 <- guesspar(threeplmod)

## extract the standard errors
sqrt(diag(vcov(gp2)))

## extract the guessing parameters on the logit scale
gp2_logit <- guesspar(threeplmod, logit = TRUE)

## along with the delta transformed standard errors
sqrt(diag(vcov(gp2_logit)))

options(digits = o$digits)
}



