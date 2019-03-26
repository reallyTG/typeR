library(mpt)


### Name: simulate.mpt
### Title: Simulate Responses from MPT Models
### Aliases: simulate.mpt
### Keywords: models

### ** Examples

data(retroact)
 
mpt1 <- mpt(mptspec(
  c*r,
  (1 - c)*u^2,
  2*(1 - c)*u*(1 - u),
  c*(1 - r) + (1 - c)*(1 - u)^2,
  u,
  1 - u
), retroact[retroact$lists == 1,])

simulate(mpt1)

## Perform parametric bootstrap
LR.stat <- replicate(200, deviance(mpt(mpt1$spec, simulate(mpt1))))

hist(LR.stat, col="lightgray", border="white", freq=FALSE, breaks=20,
     main="Parametric bootstrap")
curve(dchisq(x, df=1), add=TRUE)
abline(v=deviance(mpt1), lty=2)



