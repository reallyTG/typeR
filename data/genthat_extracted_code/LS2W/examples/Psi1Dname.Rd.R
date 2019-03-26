library(LS2W)


### Name: Psi1Dname
### Title: Return a PsiJ list object style name.
### Aliases: Psi1Dname
### Keywords: models

### ** Examples

#
# What's the name of the order 4 Haar PsiJ object?
#
 Psiname(-4, filter.number=1, family="DaubExPhase")
#[1] "D1Psi.4.1.DaubExPhase"
#
# What's the name of the order 12 Daubechies least-asymmetric wavelet PsiJ
# with 7 vanishing moments?
#
 Psiname(-12, filter.number=7, family="DaubLeAsymm")             
#[1] "D1Psi.12.7.DaubLeAsymm"



