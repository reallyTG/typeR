library(wavethresh)


### Name: support
### Title: Returns support of compactly supported wavelets.
### Aliases: support
### Keywords: math

### ** Examples

#
# What is the support of a Haar wavelet?
#
support(filter.number=1, family="DaubExPhase", m=0, n=0)
#$lh
#[1] 0
#
#$rh
#[1] 2
#
#$psi.lh
#[1] 0
#
#$psi.rh
#[1] 1
#
#$phi.lh
#[1] 0
#
#$phi.rh
#[1] 1
#
# So the mother and father wavelet have support [0,1]
#



