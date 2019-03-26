library(qgcomp)


### Name: msm.predict
### Title: msm.predict: secondary prediction method for the MSM within a
###   qgcompfit object.
### Aliases: msm.predict

### ** Examples

set.seed(50)
dat <- data.frame(y=runif(50), x1=runif(50), x2=runif(50), z=runif(50))
obj <- qgcomp.boot(y ~ z + x1 + x2 + I(z*x1), expnms = c('x1', 'x2'), data=dat, q=4, B=10, seed=125)
dat2 <- data.frame(psi=seq(1,4, by=0.1))
summary(msm.predict(obj))
summary(msm.predict(obj, newdata=dat2))



