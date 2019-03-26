library(ade4)


### Name: scalewt
### Title: Compute or scale data using (weighted) means, variances and
###   covariances (possibly for the levels of a factor)
### Aliases: covwt varwt scalewt meanfacwt varfacwt covfacwt scalefacwt
### Keywords: utilities

### ** Examples

data(meau)
w <- rowSums(meau$spe)
varwt(meau$env, w)
varfacwt(meau$env, wt = w)
varfacwt(meau$env, wt = w, fac = meau$design$season)
covfacwt(meau$env, wt = w, fac = meau$design$season)
scalewt(meau$env, wt = w)



