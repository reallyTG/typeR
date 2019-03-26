library(Renext)


### Name: EM.mixexp
### Title: Expectation-Maximisation for a mixture of exponential
###   distributions
### Aliases: EM.mixexp

### ** Examples

set.seed(1234)
x <- rmixexp2(n = 100, prob1 = 0.5, rate2 = 4)
EM.mixexp(x) -> res
res$estimate
matplot(res$Theta, type = "l", lwd = 2,
        xlab = "iteration", ylab = "theta",
        main = "exponential inverse rates")



