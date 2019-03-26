library(sads)


### Name: dpareto
### Title: Pareto distribution
### Aliases: dpareto ppareto qpareto rpareto

### ** Examples

par(mfrow=c(1,2))
curve(dpareto(x, shape=3, scale=1), 1,8, ylab="Density",
      main="Pareto PDF")
curve(ppareto(x, shape=3, scale=1), 1,8, ylab="Probability",
      main="Pareto CDF")
par(mfrow=c(1,1))


## Quantile is the inverse function of probability:
p.123 <-ppareto(1:3,shape=3,scale=0.99) 
all.equal(qpareto(p.123, shape=3, scale=0.99), 1:3) 



