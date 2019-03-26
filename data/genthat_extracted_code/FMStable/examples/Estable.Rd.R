library(FMStable)


### Name: Estable
### Title: Extremal or Maximally Skew Stable Distributions
### Aliases: Estable dEstable pEstable qEstable tailsEstable
### Keywords: distribution

### ** Examples

tailsEstable(-2:3, setMomentsFMstable(mean=1, sd=1.5, alpha=1.7))

# Compare Estable and FMstable
obj <- setMomentsFMstable(1.7, mean=.5, sd=.2)
x <- c(.001, 1, 10)
pFMstable(x,  obj, lower.tail=TRUE, log=TRUE)
pEstable(-log(x), obj, lower.tail=FALSE, log=TRUE)

x <- seq(from=-5, to=10, length=30)
plot(x, dEstable(x, setMomentsFMstable(alpha=1.5)), type="l", log="y",
  ylab="Log(density) for stable distribution",
  main="log stable distribution with alpha=1.5, mean=1, sd=1" )

x <- seq(from=-2, to=5, length=30)
plot(x, x, ylim=c(0,1), type="n", ylab="Distribution function")
for (i in 0:2)lines(x, pEstable(x,
  setParam(location=0, logscale=-.5, alpha=1.5, pm=i)), col=i+1)
legend("bottomright", legend=paste("S", 0:2, sep=""), lty=rep(1,3), col=1:3)

p <- c(1.e-10, .01, .1, .2, .5, .99, 1-1.e-10)
obj <- setMomentsFMstable(alpha=1.95)
result <- qEstable(p, obj)
pEstable(result, obj) - p

# Plot to illustrate continuity near alpha=1
y <- seq(from=-36, to=0, length=30)
logprob <- -exp(-y)
plot(0, 0, type="n", xlim=c(-25,0), ylim=c(-35, -1),
  xlab="x (M parametrization)", ylab="-log(-log(distribution function))")
for (oneminusalpha in seq(from=-.2, to=0.2, by=.02)){
  obj <- setParam(oneminusalpha=oneminusalpha, location=0, logscale=0, pm=0)
  type <- if(oneminusalpha==0) 2 else 1
  lines(qEstable(logprob, obj, log=TRUE), y, lty=type, lwd=type)
}



