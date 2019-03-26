library(insol)


### Name: sunpos
### Title: Azimuth and zenith of the Sun
### Aliases: sunpos

### ** Examples

## Julian Day hourly intervals at spring equinox
jd = JD(seq(ISOdate(2019,3,20,0),ISOdate(2019,3,20,23),by="hour"))

## sun position
sp = sunpos(sunvector(jd,46.813,9.844,1))

## daylight zenith<=90
sp = sp[which(sp[,2]<=90),]

## Plot the apparent solar path at Davos on the spring equinox
ramp = colorRamp(c("red", "orange","yellow"))
crmp = c(rgb(ramp(seq(1/6,1,1/6)), max = 255),rgb(ramp(seq(1,1/6,-1/6)), max = 255))
plot(sp[,1],90-sp[,2],xlab='Azimuth',
	ylab='Elevation',main='Apparent solar path at Davos on the spring equinox',
	pch=20,col=crmp,cex=(300-sp[,2])/90)
	
## Not run: 
##D require(plotrix)
##D polar.plot(90-sp[,2],sp[,1],start=90,clockwise=TRUE,rp.type='s',
##D 	point.symbols=20,point.col=2,cex=2,radial.lim=c(0,90),
##D 	main='Apparent solar path at Davos on the spring equinox')
## End(Not run)



