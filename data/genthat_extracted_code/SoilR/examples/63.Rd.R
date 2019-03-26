library(SoilR)


### Name: Hua2013
### Title: Atmospheric radiocarbon for the period 1950-2010 from Hua et al.
###   (2013)
### Aliases: Hua2013
### Keywords: datasets

### ** Examples


plot(Hua2013$NHZone1$Year.AD, Hua2013$NHZone1$mean.Delta14C, 
     type="l",xlab="Year AD",ylab=expression(paste(Delta^14,"C (\u2030)")))
lines(Hua2013$NHZone2$Year.AD,Hua2013$NHZone2$mean.Delta14C,col=2)
lines(Hua2013$NHZone3$Year.AD,Hua2013$NHZone3$mean.Delta14C,col=3)
lines(Hua2013$SHZone12$Year.AD,Hua2013$SHZone12$mean.Delta14C,col=4)
lines(Hua2013$SHZone3$Year.AD,Hua2013$SHZone3$mean.Delta14C,col=5)
legend(
	"topright",
	c(
		"Norther hemisphere zone 1",
		"Norther hemisphere zone 2",
		"Norther hemisphere zone 3",
                "Southern hemisphere zones 1 and 2",
		"Southern Hemispher zone 3"
	),
	lty=1,
	col=1:5,
	bty="n"
)




