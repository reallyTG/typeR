library(fishMod)


### Name: pgm
### Title: Fitting models based on the Poisson-Gamma model.
### Aliases: pgm pgm
### Keywords: misc

### ** Examples

my.coef <- c(0.6, 1.2, 0, -0.3, 0, -0.5, 0.85)
sim.dat <- simReg( n=250, lambda.tau=my.coef[1:3], mu.Z.tau=my.coef[4:6], alpha=my.coef[7])
fm <- pgm( p.form=y~1+x1+x2, g.form=~1+x1+x2, data=sim.dat)
tmp <- matrix( c( my.coef, fm$coef, sqrt( diag( fm$vcov))), ncol=3)
tmp[nrow( tmp),1] <- log( tmp[nrow( tmp),1])  #putting values on same scale
colnames( tmp) <- c("actual","estiated","SE")
rownames( tmp) <- names( fm$coef)
print( tmp)



