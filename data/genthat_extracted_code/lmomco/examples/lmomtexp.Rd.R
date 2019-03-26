library(lmomco)


### Name: lmomtexp
### Title: L-moments of the Truncated Exponential Distribution
### Aliases: lmomtexp
### Keywords: L-moment (distribution) Distribution: Exponential (trimmed)

### ** Examples

set.seed(1) # to get a suitable L-CV
X <- rexp(1000, rate=.001) + 100
Y <- X[X <= 2000]
lmr <- lmoms(Y)

print(lmr$lambdas)
print(lmomtexp(partexp(lmr))$lambdas)

print(lmr$ratios)
print(lmomtexp(partexp(lmr))$ratios)



