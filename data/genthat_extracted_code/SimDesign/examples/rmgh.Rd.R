library(SimDesign)


### Name: rmgh
### Title: Generate data with the multivariate g-and-h distribution
### Aliases: rmgh

### ** Examples


set.seed(1)

# univariate
norm <- rmgh(10000,1e-5,0)
hist(norm)

skew <- rmgh(10000,1/2,0)
hist(skew)

neg_skew_platykurtic <- rmgh(10000,-1,-1/2)
hist(neg_skew_platykurtic)

# multivariate
sigma <- matrix(c(2,1,1,4), 2)
mean <- c(-1, 1)
twovar <- rmgh(10000, c(-1/2, 1/2), c(0,0),
    mean=mean, sigma=sigma)
hist(twovar[,1])
hist(twovar[,2])
plot(twovar)




