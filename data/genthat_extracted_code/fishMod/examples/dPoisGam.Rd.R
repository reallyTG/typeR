library(fishMod)


### Name: dPoisGam
### Title: Density, derivatives, distribution function, and random
###   generation for the Poisson-Gamma distribution.
### Aliases: dPoisGam dPoisGam dPoisGamDerivs pPoisGam rPoisGam
### Keywords: misc

### ** Examples

my.seq <- seq( from=0, to=20, length=200)
par( mfrow=c( 1,2))
plot( my.seq, dPoisGam( y=my.seq, lambda=8, mu.Z=1.2, alpha=0.6, LOG=FALSE), type='l',
 xlab="Variable", ylab="Density")
plot( my.seq, pPoisGam( q=my.seq, lambda=8, mu.Z=1.2, alpha=0.6), type='l',
 xlab="Variable", ylab="Distribution")



