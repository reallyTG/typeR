library(stepR)


### Name: family
### Title: Family of distributions
### Aliases: family
### Keywords: distribution

### ** Examples

# illustrating different families fitted to the same binomial data set
size <- 200
n <- 200
# truth
p <- 10^seq(-3, -0.1, length = n)
# data
y <- rbinom(n, size, p)
plot(y)
lines(size * p, col = "red")
# fit 4 jumps, binomial family
jumps <- 4
bfit <- steppath(y, family = "binomial", param = size, max.blocks = jumps)
lines(bfit[[jumps]], col = "orange")
# Gaussian approximation with estimated variance
gfit <- steppath(y, family = "gauss", max.blocks = jumps)
lines(gfit[[jumps]], col = "green3", lty = 2)
# Poisson approximation
pfit <- steppath(y, family = "poisson", max.blocks = jumps)
lines(pfit[[jumps]], col = "blue", lty = 2)
legend("topleft", legend = c("binomial", "gauss", "poisson"), lwd = 2,
  col = c("orange", "green3", "blue"))



