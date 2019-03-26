library(rotations)


### Name: discord
### Title: Measure of Discord
### Aliases: discord

### ** Examples

#Compute the measures of discord for a sample from the Cayley distribution
Rs <- ruars(20,rcayley,kappa=1)
Hi <- discord(Rs, type='intrinsic')
He <- discord(Rs, type='extrinsic')

#Compare to the theoretical F distribution
OrdHi <- sort(Hi)
OrdHe <- sort(He)

par(mfrow=c(1,2))
plot(ecdf(OrdHi),main='Intrinsic',xlim=range(c(OrdHi,OrdHe)))
lines(OrdHi,pf(OrdHi,3,3*(length(OrdHi)-2)))

plot(ecdf(OrdHe),main='Extrinsic',xlim=range(c(OrdHi,OrdHe)))
lines(OrdHi,pf(OrdHi,3,3*(length(OrdHe)-2)))



