library(fishMod)


### Name: dTweedie
### Title: Density, derivatives, distribution function, and random
###   generation for the Tweedie distribution.
### Aliases: dTweedie dTweedie pTweedie rTweedie
### Keywords: misc

### ** Examples

my.seq <- seq( from=0, to=20, length=200)
par( mfrow=c( 1,2))
plot( my.seq, dTweedie( y=my.seq, mu=5, phi=2.1, p=1.6, LOG=FALSE),
 type='l', xlab="Variable", ylab="Density")
plot( my.seq, pTweedie( q=my.seq, mu=5, phi=2.1, p=1.6),
 type='l', xlab="Variable", ylab="Distribution")



