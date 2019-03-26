library(LS2W)


### Name: Phi1Dname
### Title: Return a PhiJ list object style name.
### Aliases: Phi1Dname
### Keywords: models

### ** Examples

#
# What's the name of the order 4 Haar PhiJ object?
#
 Phi1Dname(-4, filter.number=1, family="DaubExPhase")
#[1] "D1Phi.4.1.DaubExPhase"
#
# What's the name of the order 12 Daubechies least-asymmetric wavelet PhiJ
# with 7 vanishing moments?
#
 Phi1Dname(-12, filter.number=7, family="DaubLeAsymm")             
#[1] "D1Phi.12.7.DaubLeAsymm"



