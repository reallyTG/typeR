library(copula)


### Name: retstable
### Title: Sampling Exponentially Tilted Stable Distributions
### Aliases: retstable retstableR
### Keywords: distribution

### ** Examples

## Draw random variates from an exponentially tilted stable distribution
## with given alpha, V0, and h = 1
alpha <- .2
V0 <- rgamma(200, 1)
rETS <- retstable(alpha, V0)

## Distribution plot the random variates -- log-scaled
hist(log(rETS), prob=TRUE)
lines(density(log(rETS)), col=2)
rug (log(rETS))



