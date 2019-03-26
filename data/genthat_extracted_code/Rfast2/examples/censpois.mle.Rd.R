library(Rfast2)


### Name: MLE of the left censored Poisson distribution
### Title: MLE of the left censored Poisson distribution
### Aliases: censpois.mle

### ** Examples



x1 <- rpois(10000,15)
x <- x1
x[x<=10] = 10
mean(x)
censpois.mle(x)$lambda



