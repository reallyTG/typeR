library(Rcapture)


### Name: profileCI
### Title: Profile Likelihood Confidence Interval for Abundance Estimation
###   in Closed Populations Capture-Recapture Experiments
### Aliases: profileCI print.profileCI
### Keywords: models

### ** Examples

data(hare)
profileCI(hare, m = "Mth", h = "Poisson", a = 2)

data(HIV)
mat <- histpos.t(4)
mX2 <- cbind(mat, mat[, 1] * mat[, 2])

profileCI(hare, m = "Mh", h = "Chao") 



