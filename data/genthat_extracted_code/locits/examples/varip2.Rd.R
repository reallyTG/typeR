library(locits)


### Name: varip2
### Title: Direct computation of estimate of variance of v_ip, the Haar
###   wavelet coefficients of the periodogram.
### Aliases: varip2
### Keywords: ts

### ** Examples

#
# Generate autocorrelation wavelets
#
P1 <- PsiJ(-5, filter.number=1, family="DaubExPhase")
#
#
# Now compute varip2: this is the variance of the Haar wavelet coefficient
# at the finest scale, location 10 and P1 autocorrelation wavelet.
# Note, I've used S to be the exact coefficients which would be for white noise.
# In practice, S would be an *estimate* calculated from the data.
#
varip2(i=1, p=10, ll=2, S=c(1/2, 1/4, 1/8, 1/16, 1/32), P=P1)
#
# Ans component is 1.865244
  


