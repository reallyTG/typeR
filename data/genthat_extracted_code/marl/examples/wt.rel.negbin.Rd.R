library(marl)


### Name: wt.rel.negbin
### Title: Weighted relative likelihood function based on Negative Binomial
###   distribution.
### Aliases: wt.rel.negbin
### Keywords: Negative.Binomial Clustering

### ** Examples

mu.min <- 0.5; mu.max <- 50; len <- 100
y <- rnbinom(10,mu=10,size=3)
wt.rel.negbin(y,mu.min,mu.max,plot = TRUE, len = len) 



