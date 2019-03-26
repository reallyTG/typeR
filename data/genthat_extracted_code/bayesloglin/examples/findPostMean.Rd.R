library(bayesloglin)


### Name: findPostMean
### Title: Posterior covariance matrix for a decomposable model.
### Aliases: findPostMean
### Keywords: htest models

### ** Examples

data(czech)
formula <- freq ~ b*c + a*c*e + d*e + f
s <- findPostMean (formula, alpha = 1, data = czech)
print(s)



