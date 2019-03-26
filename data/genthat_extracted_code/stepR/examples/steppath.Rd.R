library(stepR)


### Name: steppath
### Title: Solution path of step-functions
### Aliases: steppath steppath.default steppath.stepcand [[.steppath
###   length.steppath print.steppath logLik.steppath
### Keywords: nonparametric

### ** Examples

# simulate 5 blocks (4 jumps) within a total of 100 data points
b <- c(sort(sample(1:99, 4)), 100)
f <- rep(rnorm(5, 0, 4), c(b[1], diff(b)))
# add Gaussian noise
x <- f + rnorm(100)
# find 10 candidate jumps
cand <- stepcand(x, max.cand = 10)
cand
# compute solution path
path <- steppath(cand)
path
plot(x)
lines(path[[5]], col = "red")
# compare result having 5 blocks with truth
fit <- path[[5]]
fit
logLik(fit)
AIC(logLik(fit))
cbind(fit, trueRightEnd = b, trueLevel = unique(f))
# for poisson observations
y <- rpois(100, exp(f / 10) * 20)
# compute solution path, compare result having 5 blocks with truth
cbind(steppath(y, max.cand = 10, family = "poisson")[[5]],
  trueRightEnd = b, trueIntensity = exp(unique(f) / 10) * 20)
# for binomial observations
size <- 10
z <- rbinom(100, size, pnorm(f / 10))
# compute solution path, compare result having 5 blocks with truth
cbind(steppath(z, max.cand = 10, family = "binomial", param = size)[[5]],
  trueRightEnd = b, trueIntensity = pnorm(unique(f) / 10))
# an example where stepcand is not optimal but indices found are close to optimal ones
blocks <- c(rep(0, 9), 1, 3, rep(1, 9))
blocks
stepcand(blocks, max.cand = 3)[,c("rightEnd", "value", "number")]
# erroneously puts the "1" into the right block in the first step
steppath(blocks)[[3]][,c("rightEnd", "value")]
# putting the "1" in the middle block is optimal
steppath(blocks, max.cand = 3, cand.radius = 1)[[3]][,c("rightEnd", "value")]
# also looking in the 1-neighbourhood remedies the problem



