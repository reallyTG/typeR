library(GLDEX)


### Name: fun.comp.moments.ml.2
### Title: Compare the moments of the data and the fitted univariate
###   generalised lambda distribution. Specialised funtion designed for
###   RMFMKL.ML and STAR methods.
### Aliases: fun.comp.moments.ml.2
### Keywords: univar

### ** Examples


## Generate random normally distributed observations.
# junk<-rnorm(1000,3,2)

## Fit the dataset using fun.data.ml
# fit<-cbind(fun.RMFMKL.ml(junk),starship(junk)$lambda)

## Compare the resulting fits. It is usually the case the maximum likelihood 
## provides better estimation of the moments than the starship method.
# fun.comp.moments.ml.2(fit,junk)



