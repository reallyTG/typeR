library(LICORS)


### Name: rdensity
### Title: Generate random sample from density() or wKDE
### Aliases: rdensity
### Keywords: # distribution nonparametric

### ** Examples

set.seed(1923)
xx <- c(rnorm(100, mean = 2), runif(100))
aa <- density(xx)
plot(aa)
xx_sample <- rdensity(n = 1000, fhat = aa, data = xx)
lines(density(xx_sample), col = 2)



