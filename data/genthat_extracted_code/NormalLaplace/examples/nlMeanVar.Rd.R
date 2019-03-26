library(NormalLaplace)


### Name: NormalLaplaceMeanVar
### Title: Mean, Variance, Skewness and Kurtosis of the Normal Laplace
###   Distribution.
### Aliases: NormalLaplaceMeanVar nlMean nlVar nlSkew nlKurt
### Keywords: distribution

### ** Examples

param <- c(10,1,5,9)
nlMean(param = param)
nlVar(param = param)
nlSkew(param = param)
nlKurt(param = param)


curve(dnl(x, param = param), -10, 10)




