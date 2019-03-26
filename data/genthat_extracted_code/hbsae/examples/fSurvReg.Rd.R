library(hbsae)


### Name: fSurvReg
### Title: Compute small area estimates based on the survey regression
###   estimator.
### Aliases: fSurvReg

### ** Examples

d <- generateFakeData()

# generate design matrix, variable of interest, area indicator and population data
dat <- fSAE(y0 ~ x + area2, data=d$sam, area="area", popdata=d$Xpop, type="data")

sae <- fSurvReg(dat$y, dat$X, dat$area, dat$Narea, dat$PopMeans)
EST(sae)  # estimates
SE(sae)  # standard errors



