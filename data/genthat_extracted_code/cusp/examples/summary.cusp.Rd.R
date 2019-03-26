library(cusp)


### Name: summary.cusp
### Title: Summarizing Cusp Catastrophe Model Fits
### Aliases: summary.cusp print.summary.cusp
### Keywords: utilities models

### ** Examples

set.seed(97)
x1 = runif(150)
x2 = runif(150)
z = Vectorize(rcusp)(1, 4*x1-2, 4*x2-1)
data <- data.frame(x1, x2, z)
fit <- cusp(y ~ z, alpha ~ x1+x2, beta ~ x1+x2, data)
print(fit)
summary(fit, logist=FALSE) # set logist to TRUE to compare to logistic fit



