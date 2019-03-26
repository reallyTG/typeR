library(TailRank)


### Name: BetaBinomial
### Title: The Beta-Binomial Distribution
### Aliases: dbb pbb qbb rbb
### Keywords: univar htest

### ** Examples

# set up parameters
w <- 10
u <- 0.3*w
v <- 0.7*w
N <- 12
# generate random values from the beta-binomial
x <- rbb(1000, N, u, v)

# check that the empirical summary matches the theoretical one
summary(x)
qbb(c(0.25, 0.50, 0.75), N, u, v)

# check that the empirpical histogram matches te theoretical density
hist(x, breaks=seq(-0.5, N + 0.55), prob=TRUE)
lines(0:N, dbb(0:N, N, u,v), type='b')



