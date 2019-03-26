library(LS2W)


### Name: A2name
### Title: Return a D2Amat list object style name.
### Aliases: A2name
### Keywords: models

### ** Examples

#
# What's the name of the order 4 Haar matrix when structured by scale within decompositon direction?
#
A2name(J=-4, filter.number=1, family="DaubExPhase", switch="direction")
#[1] "D2Amat.d.4.1.DaubExPhase"
#
# What's the name of the order 15 Daubechies least-asymmetric wavelet
# with 7 vanishing moments, when ordered by direction within each scale?
#
A2name(J=-15, filter.number=7, family="DaubLeAsymm")
#[1] "D2Amat.l.15.7.DaubLeAsymm"



