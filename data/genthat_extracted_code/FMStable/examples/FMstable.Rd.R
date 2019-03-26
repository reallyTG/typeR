library(FMStable)


### Name: FMstable
### Title: Finite Moment Log Stable Distributions
### Aliases: FMstable dFMstable pFMstable pFMstable.alpha0 qFMstable
###   tailsFMstable
### Keywords: distribution

### ** Examples

tailsFMstable(1:10, setMomentsFMstable(3, 1.5, alpha=1.7))

x <- c(-1, 0, 1.e-5, .001, .01, .03, seq(from=.1, to=4.5, length=100))
plot(x, pFMstable(x, setMomentsFMstable(1, 1.5, 2)), type="l" ,xlim=c(0, 4.3),
  ylim=c(0,1), ylab="Distribution function")
for (alpha in c(.03, 1:19/10)) lines(x, pFMstable(x,
  setMomentsFMstable(1, 1.5, alpha)), col=2)
lines(x, pFMstable.alpha0(x, mean=1, sd=1.5), col=3)

p <- c(1.e-10, .01, .1, .2, .5, .99, 1-1.e-10)
obj <- setMomentsFMstable(alpha=1.95)
result <- qFMstable(p, obj)
OK <- result > 0
pFMstable(result[OK], obj) - p[OK]



