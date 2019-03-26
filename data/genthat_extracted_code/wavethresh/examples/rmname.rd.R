library(wavethresh)


### Name: rmname
### Title: Return a ipndacw matrix style name.
### Aliases: rmname
### Keywords: manip

### ** Examples

#
# What's the name of the order 4 Haar matrix?
#
rmname(-4, filter.number=1, family="DaubExPhase")
#[1] "rm.4.1.DaubExPhase"
#
# What's the name of the order 12 Daubechies least-asymmetric wavelet
# with 7 vanishing moments?
#
rmname(-12, filter.number=7, family="DaubLeAsymm")             
#[1] "rm.12.7.DaubLeAsymm"



