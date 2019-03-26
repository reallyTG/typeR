library(mistat)


### Name: mahalanobisT2
### Title: Mahalanobis T^2
### Aliases: mahalanobisT2
### Keywords: multivariate

### ** Examples

data(DISS)

mahalanobisT2(DISS[, c("batch", "min15", "min90")], 
              factor.name="batch", 
              conf.level=0.90,
              compare.to=c(15, 15))



