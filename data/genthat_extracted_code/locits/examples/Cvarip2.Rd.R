library(locits)


### Name: Cvarip2
### Title: Computes variance of Haar wavelet coefficients of wavelet
###   periodogram using C code.
### Aliases: Cvarip2
### Keywords: ts

### ** Examples

#
# See example from varip2
#
#
my.Pmat <- PsiJmat(-5, filter.number=1, family="DaubExPhase")
my.PsiJ <- PsiJ(-5, filter.number=1, family="DaubExPhase")
my.PsiJL <- sapply(my.PsiJ, "length")
Cvarip2(i=1, p=10, ll=2, S=c(1/2,1/4,1/8,1/16,1/32),
    Pmat=my.Pmat, PsiJL=my.PsiJL)
#
# Gives answer 1.865244, which is the same as given in the example for varip2



