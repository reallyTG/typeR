library(astrochron)


### Name: surrogates
### Title: Generate phase-randomized surrogate series as in Ebisuzaki
###   (1997)
### Aliases: surrogates

### ** Examples

# generate example series with 3 precession terms and noise
ex <- cycles(start=0,end=500,noisevar=.0004,dt=5)

# generate phase-randomized surrogates 
ran_ex <- surrogates(ex,nsim=1)

# compare periodograms of data and surrogates
res1 <- periodogram(ex,padfac=0,output=1,genplot=FALSE)
res2 <- periodogram(ran_ex,padfac=0,output=1,genplot=FALSE)

pl(2)
plot(ex,type="l",main="black=original; red=surrogate")
lines(ran_ex,col="red",lty=4)
plot(res1[,1],res1[,2],type="l",lwd=2,main="black=original; red=surrogate",
     xlab="frequency",ylab="amplitude")
lines(res2[,1],res2[,2],col="red",lwd=2,lty=4)



