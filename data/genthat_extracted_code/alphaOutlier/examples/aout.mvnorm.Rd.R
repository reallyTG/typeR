library(alphaOutlier)


### Name: aout.mvnorm
### Title: Find alpha-outliers in multivariate normal data
### Aliases: aout.mvnorm
### Keywords: distribution

### ** Examples

temp <- iris[1:51,-5]
temp.xq <- apply(FUN = median, MARGIN = 2, temp)
aout.mvnorm(as.matrix(temp), param = list(temp.xq, cov(temp)), alpha = 0.001)



