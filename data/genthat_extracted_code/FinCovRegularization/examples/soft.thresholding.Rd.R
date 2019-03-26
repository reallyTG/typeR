library(FinCovRegularization)


### Name: soft.thresholding
### Title: Soft-Thresholding Opreator on Covariance Matrix
### Aliases: soft.thresholding

### ** Examples

data(m.excess.c10sp9003)
cov.SAM <- cov(m.excess.c10sp9003)
soft.thresholding(cov.SAM, threshold = 0.001)



