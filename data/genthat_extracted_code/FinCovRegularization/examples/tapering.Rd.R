library(FinCovRegularization)


### Name: tapering
### Title: Tapering Opreator on Covariance Matrix
### Aliases: tapering

### ** Examples

data(m.excess.c10sp9003)
cov.SAM <- cov(m.excess.c10sp9003)
tapering(cov.SAM, l=7, h = 1/2)



