library(ICtest)


### Name: plot.ictest
### Title: Scatterplot Matrix for a ictest Object
### Aliases: plot.ictest
### Keywords: hplot

### ** Examples

n <- 200
X <- cbind(rnorm(n, sd = 2), rnorm(n, sd = 1.5), rnorm(n), rnorm(n), rnorm(n))

TestCov <- PCAasymp(X, k = 2)
plot(TestCov)
plot(TestCov, which = "k")



