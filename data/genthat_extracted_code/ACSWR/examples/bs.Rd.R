library(ACSWR)


### Name: bs
### Title: Simulated Sample from Binomial Distribution
### Aliases: bs
### Keywords: score function, binomial distribution

### ** Examples

data(bs)
n <- 10
sample_means <- colMeans(bs)
binomial_score_fn <- function(p,xbar)
      n*(xbar-10*p)/(p*(1-p))
p <- seq(from=0,to=1,by=0.02)
plot(p,sapply(p,binomial_score_fn,xbar=sample_means[1]),"l",xlab=expression(p),
ylab=expression(S(p)))
title(main="C: Score Function Plot of Binomial Model")
for(i in 2:20) lines(p,sapply(p,
binomial_score_fn,xbar=sample_means[i]),"l")
abline(v=4)
abline(h=0)



