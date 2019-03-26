library(LambertW)


### Name: U-utils
### Title: Zero-mean, unit-variance version of standard distributions
### Aliases: U-utils dU pU qU rU
### Keywords: datagen distribution univar

### ** Examples


# a zero-mean, unit variance version of the t_3 distribution.
curve(dU(x, beta = c(1, 1, 3), distname = "t"), -4, 4,
      ylab = "pdf", xlab = "u",
      main = "student-t \n zero-mean, unit variance")
# cdf of unit-variance version of an exp(3) -> just an exp(1)
curve(pU(x, beta = 3, distname = "exp"), 0, 4, ylab = "cdf", xlab = "u",
      main = "Exponential \n unit variance", col = 2, lwd = 2) 
curve(pexp(x, rate = 1), 0, 4, add = TRUE, lty = 2)
# all have (empirical) variance 1
var(rU(n = 1000, distname = "chisq", beta = 2))
var(rU(n = 1000, distname = "normal", beta = c(3, 3)))
var(rU(n = 1000, distname = "exp", beta = 1))
var(rU(n = 1000, distname = "unif", beta = c(0, 10)))




