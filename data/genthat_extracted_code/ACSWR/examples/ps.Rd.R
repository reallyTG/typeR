library(ACSWR)


### Name: ps
### Title: Simulated Sample from Poisson Distribution
### Aliases: ps
### Keywords: maximum likelihood estimator

### ** Examples

data(ps)
n <- 10
sample_means <- colMeans(ps)
poisson_score_fn <- function(theta,xbar) n*(xbar-theta)/theta
theta <- seq(from=2,to=8,by=0.2)
plot(theta,sapply(theta,poisson_score_fn,xbar=sample_means[1]),"l",xlab=
  expression(lambda),ylab=expression(S(lambda)),ylim=c(-5,15))
title(main="B: Score Function Plot of the Poisson Model")
for(i in 2:20) 
lines(theta,sapply(theta,poisson_score_fn,xbar=sample_means[i]),"l")
abline(v=4)
abline(h=0)


