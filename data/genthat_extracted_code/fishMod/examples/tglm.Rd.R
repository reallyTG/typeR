library(fishMod)


### Name: tglm
### Title: Fits a Tweedie GLM via maximum likelihood.
### Aliases: tglm tglm tglm.fit
### Keywords: misc

### ** Examples

print( "Data generated using Poisson-sum-of-gammas model and fitted using a Tweedie GLM.")
print( "A great fit is not expected -- especially for the first covariate")
my.coef <- c(0.6, 1.2, 0, -0.3, 0, -0.5, 0.85)
sim.dat <- simReg( n=250, lambda.tau=my.coef[1:3], mu.Z.tau=my.coef[4:6], alpha=my.coef[7])
fm <- tglm( mean.form=y~1+x1+x2, data=sim.dat)
tmp <- matrix( c( my.coef[1:3] + my.coef[4:6], NA, (2+0.85)/(1+0.85), fm$coef), ncol=2)
colnames( tmp) <- c("actual","estimated")
rownames( tmp) <- c( names( fm$coef)[1:3], "phi", "p")
print( tmp)



