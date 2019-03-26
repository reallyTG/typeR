library(FinCovRegularization)


### Name: hard.thresholding
### Title: Hard-Thresholding Opreator on Covariance Matrix
### Aliases: hard.thresholding

### ** Examples

data(m.excess.c10sp9003)
cov.SAM <- cov(m.excess.c10sp9003)
hard.thresholding(cov.SAM, threshold = 0.001)



