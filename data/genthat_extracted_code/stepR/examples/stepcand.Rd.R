library(stepR)


### Name: stepcand
### Title: Forward selection of candidate jumps
### Aliases: stepcand
### Keywords: nonparametric

### ** Examples

# simulate 5 blocks (4 jumps) within a total of 100 data points
b <- c(sort(sample(1:99, 4)), 100)
f <- rep(rnorm(5, 0, 4), c(b[1], diff(b)))
rbind(b = b, f = unique(f), lambda = exp(unique(f) / 10) * 20)
# add gaussian noise
x <- f + rnorm(100)
# find 10 candidate jumps
stepcand(x, max.cand = 10)
# for poisson observations
y <- rpois(100, exp(f / 10) * 20)
# find 10 candidate jumps
stepcand(y, max.cand = 10, family = "poisson")
# for binomial observations
size <- 10
z <- rbinom(100, size, pnorm(f / 10))
# find 10 candidate jumps
stepcand(z, max.cand = 10, family = "binomial", param = size)



