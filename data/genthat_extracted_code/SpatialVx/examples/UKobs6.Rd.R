library(SpatialVx)


### Name: UKobs6
### Title: Example Precipitation Rate Verification Set (NIMROD)
### Aliases: UKobs6 UKfcst6 UKloc
### Keywords: datasets

### ** Examples

data( "UKobs6" )
data( "UKfcst6" )
data( "UKloc" )

zl <- range(c(c(UKobs6), c(UKfcst6)))
par(mfrow=c(1,2))
image(UKobs6, col=c("grey", tim.colors(64)), zlim=zl, main="analysis", axes=FALSE)
par(usr=apply(UKloc, 2, range))
map(add=TRUE)
image.plot(UKfcst6, col=c("grey", tim.colors(64)), zlim=zl, main="forecast", axes=FALSE)
par(usr=apply(UKloc, 2, range))
map(add=TRUE)



