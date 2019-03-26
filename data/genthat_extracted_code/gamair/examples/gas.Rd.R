library(gamair)


### Name: gas
### Title: Octane rating data
### Aliases: gas
### Keywords: data

### ** Examples

require(gamair);require(mgcv)
data(gas)
## plot some spectra...
with(gas,plot(nm[1,],NIR[1,],type="l",ylab="log(1/R)",
     xlab="wavelength (nm)",col=1))
text(1000,1.2,"octane");text(1000,1.2-.1,gas$octane[1],col=1)
for (i in 2:8) { lines(gas$nm[i,],gas$NIR[i,],col=i)
  text(1000,1.2-.1*i,gas$octane[i],col=i)
}

## Fit scalar on function regression...

b <- gam(octane~s(nm,by=NIR,k=50),data=gas)

gam.check(b)

par(mfrow=c(1,2))
plot(b,scheme=1)
plot(fitted(b),gas$octane,xlab="fitted octane",
     ylab="observed octane");abline(0,1)




