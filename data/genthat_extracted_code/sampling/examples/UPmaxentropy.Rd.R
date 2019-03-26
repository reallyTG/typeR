library(sampling)


### Name: UPmaxentropy
### Title: Maximum entropy sampling with fixed sample size and unequal
###   probabilities
### Aliases: UPmaxentropy UPmaxentropypi2 UPMEqfromw UPMEpikfromq
###   UPMEpiktildefrompik UPMEsfromq UPMEpik2frompikw
### Keywords: survey

### ** Examples

############
## Example 1
############
# Simple example - sample selection 
pik=c(0.07,0.17,0.41,0.61,0.83,0.91)
# First method
UPmaxentropy(pik)
# Second method by using the intermediate procedures
n=sum(pik)
pikt=UPMEpiktildefrompik(pik)
w=pikt/(1-pikt)
q=UPMEqfromw(w,n)
UPMEsfromq(q)
# The matrix of inclusion probabilities
# First method: direct computation from pik
UPmaxentropypi2(pik)
# Second method: computation from pik and w
UPMEpik2frompikw(pik,w)
############
## Example 2
############
# other examples in the 'UPexamples' vignette
vignette("UPexamples", package="sampling")



