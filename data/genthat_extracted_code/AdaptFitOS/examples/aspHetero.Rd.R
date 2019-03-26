library(AdaptFitOS)


### Name: aspHetero
### Title: Estimate varying residual variance
### Aliases: aspHetero
### Keywords: smooth

### ** Examples

attach(mcycle)

y=accel
kn1 <- default.knots(times,20)
# fit model with constant residual variance
  fit= asp2(accel~f(times,basis="os",degree=3,knots=kn1,adap=FALSE),
  								niter = 20, niter.var = 200)


# fit model with varying residual variance
fith=aspHetero(fit,times,tol=1e-8)
op <- par(mfrow = c(1,3))
plot(fit);plot(fith)
#sigma() returns the fitted varying residual variance
plot(sort(times),sigma(fith)[order(times)],type="l")
par(op)



