library(metaBMA)


### Name: prior
### Title: Prior Distributions
### Aliases: prior

### ** Examples

### Half-Normal Distribution
p1 <- prior("halfnorm", c(mean=0, sd=.3), "d")
p1
p1(c(-1,1,3))
plot(p1, -.1, 1)

### Half-Cauchy Distribution
p2 <- prior("halfcauchy", c(scale=.3))
plot(p2, -.5, 3)

### Custom Prior Distribution
p3 <- prior("custom", function(x) x^2, "d", 0, 1)
plot(p3, -.1, 1.2)



