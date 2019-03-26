library(robustbase)


### Name: covOGK
### Title: Orthogonalized Gnanadesikan-Kettenring (OGK) Covariance Matrix
###   Estimation
### Aliases: covOGK covGK s_mad s_IQR hard.rejection
### Keywords: robust multivariate

### ** Examples

data(hbk)
hbk.x <- data.matrix(hbk[, 1:3])

cO1 <- covOGK(hbk.x, sigmamu = scaleTau2)
cO2 <- covOGK(hbk.x, sigmamu = s_Qn)
cO3 <- covOGK(hbk.x, sigmamu = s_Sn)
cO4 <- covOGK(hbk.x, sigmamu = s_mad)
cO5 <- covOGK(hbk.x, sigmamu = s_IQR)


data(toxicity)
cO1tox <- covOGK(toxicity, sigmamu = scaleTau2)
cO2tox <- covOGK(toxicity, sigmamu = s_Qn)

## nice formatting of correlation matrices:
as.dist(round(cov2cor(cO1tox$cov), 2))
as.dist(round(cov2cor(cO2tox$cov), 2))

## "graphical"
symnum(cov2cor(cO1tox$cov))
symnum(cov2cor(cO2tox$cov), legend=FALSE)



