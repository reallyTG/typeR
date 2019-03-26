library(locits)


### Name: covI
### Title: Compute the covariance between two wavelet periodogram ordinates
###   at the same scale, but different time locations.
### Aliases: covI
### Keywords: ts

### ** Examples

P1 <- PsiJ(-5, filter.number=1, family="DaubExPhase")
#
# Compute the covariance
#
covI(II=c(1/2, 1/4, 1/8, 1/16, 1/32), m=1, n=3, ll=5, ThePsiJ=P1)
#
# [1] 0.8430809



