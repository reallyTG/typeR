library(ACSWR)


### Name: cs
### Title: Random Samples from Cauchy Distribution
### Aliases: cs
### Keywords: Cauchy random samples, score function

### ** Examples

data(cs)
n <- 10
cauchy_score_fn  <-  function(mu,x)
      sum(2*(x-mu)/(1+(x-mu)^{2}))
mu <- seq(from=-15,to=20,by=0.5)
plot(mu,sapply(mu,cauchy_score_fn,x=cs[,1]),"l",xlab=expression(mu),
ylab=expression(S(mu)),ylim=c(-10,10))
title(main="D: Score Function Plot of Cauchy Model")
for(i in 2:20) lines(mu,sapply(mu,
cauchy_score_fn,x=cs[,i]),"l")
abline(v=4)
abline(h=0)



