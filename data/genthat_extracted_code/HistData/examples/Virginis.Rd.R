library(HistData)


### Name: Virginis
### Title: John F. W. Herschel's Data on the Orbit of the Twin Stars gamma
###   _Virginis_
### Aliases: Virginis Virginis.interp
### Keywords: datasets

### ** Examples

data(Virginis)
data(Virginis.interp)

# Herschel's interpolated curve
plot(posangle ~ year, data=Virginis.interp, 
	pch=15, type="b", col="red", cex=0.8, lwd=2,
	xlim=c(1710,1840), ylim=c(80, 170),
	ylab="Position angle (deg.)", xlab="Year",
	cex.lab=1.5)

# The data points, and indication of their uncertainty
points(posangle ~ year, data=Virginis, pch=16)
points(posangle ~ year, data=Virginis, cex=weight/2)




