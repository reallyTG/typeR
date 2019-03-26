library(refund)


### Name: fpc
### Title: Construct a FPC regression term
### Aliases: fpc

### ** Examples

data(gasoline)
par(mfrow=c(3,1))

# Fit PFCR_R
gasmod1 <- pfr(octane ~ fpc(NIR, ncomp=30), data=gasoline)
plot(gasmod1, rug=FALSE)
est1 <- coef(gasmod1)

# Fit FPCR_C with fpca.sc
gasmod2 <- pfr(octane ~ fpc(NIR, method="fpca.sc", ncomp=6), data=gasoline)
plot(gasmod2, se=FALSE)
est2 <- coef(gasmod2)

# Fit penalized model with fpca.face
gasmod3 <- pfr(octane ~ fpc(NIR, method="fpca.face", penalize=TRUE), data=gasoline)
plot(gasmod3, rug=FALSE)
est3 <- coef(gasmod3)

par(mfrow=c(1,1))
ylm <- range(est1$value)*1.35
plot(value ~ X.argvals, type="l", data=est1, ylim=ylm)
lines(value ~ X.argvals, col=2, data=est2)
lines(value ~ X.argvals, col=3, data=est3)




