library(PearsonDS)


### Name: pearsonFitM
### Title: Method of Moments Estimator for Pearson Distributions
### Aliases: pearsonFitM
### Keywords: distribution

### ** Examples

## Define moments of distribution
moments <- c(mean=1,variance=2,skewness=1,kurtosis=5)
## find Pearson distribution with these parameters
ppar <- pearsonFitM(moments=moments)
print(unlist(ppar))
## check moments
pearsonMoments(params=ppar)



