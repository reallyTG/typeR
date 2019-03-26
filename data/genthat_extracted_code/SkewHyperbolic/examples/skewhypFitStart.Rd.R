library(SkewHyperbolic)


### Name: skewhypFitStart
### Title: Find Starting Values for Fitting a Skew Hyperbolic Student
###   t-Distribution
### Aliases: skewhypFitStart skewhypFitStartLA skewhypFitStartMM
### Keywords: distribution

### ** Examples

## find starting values to feed to skewhypFit
data(lrnokeur)
skewhypFitStart(lrnokeur, startValues="LA")$paramStart
## user supplied values
skewhypFitStart(lrnokeur, startValues="US",
                paramStart=c(0,0.01,0,5))$paramStart



