library(wavethresh)


### Name: Psiname
### Title: Return a PsiJ list object style name.
### Aliases: Psiname
### Keywords: character

### ** Examples

#
# What's the name of the order 4 Haar PsiJ object?
#
Psiname(-4, filter.number=1, family="DaubExPhase")
#[1] "Psi.4.1.DaubExPhase"
#
# What's the name of the order 12 Daubechies least-asymmetric wavelet PsiJ
# with 7 vanishing moments?
#
Psiname(-12, filter.number=7, family="DaubLeAsymm")             
#[1] "Psi.12.7.DaubLeAsymm"



