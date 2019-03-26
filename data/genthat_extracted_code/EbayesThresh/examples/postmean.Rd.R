library(EbayesThresh)


### Name: postmean
### Title: Posterior mean estimator
### Aliases: postmean postmean.laplace postmean.cauchy
### Keywords: nonparametric

### ** Examples

postmean(c(-2,1,0,-4,8,50), w = 0.05, prior = "cauchy")
postmean(c(-2,1,0,-4,8,50), s = 1:6, w = 0.2, prior = "laplace", a = 0.3)



