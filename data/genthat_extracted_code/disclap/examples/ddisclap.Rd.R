library(disclap)


### Name: Discrete Laplace distribution
### Title: Probability mass function, distribution function, and random
###   generation for the discrete Laplace distribution with parameter 0 <=
###   p < 1.
### Aliases: ddisclap pdisclap rdisclap

### ** Examples

p <- 0.3
xs <- (-4):4
probd <- ddisclap(xs, p)
data.frame(xs, probd)
plot(xs, probd, type = "l", xlab = "x", ylab = "P(X = x; p)")



