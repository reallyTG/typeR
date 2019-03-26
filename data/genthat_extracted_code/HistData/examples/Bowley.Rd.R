library(HistData)


### Name: Bowley
### Title: Bowley's data on values of British and Irish trade, 1855-1899
### Aliases: Bowley
### Keywords: datasets

### ** Examples

data(Bowley)

# plot the data 
with(Bowley,plot(Year, Value, type='b', 
	ylab="Value of British and Irish Exports",
	main="Bowley's example of the method of smoothing curves"))

# find moving averages-- use center alignment (requires width=ODD)
require(gtools, warn.conflicts=FALSE)
mav3<-running(Bowley$Value, width=3, align="center")
mav5<-running(Bowley$Value, width=5, align="center")
mav9<-running(Bowley$Value, width=9, align="center")
lines(Bowley$Year[2:44], mav3, col='blue', lty=2)
lines(Bowley$Year[3:43], mav5, col='green3', lty=3)
lines(Bowley$Year[5:41], mav9, col='brown', lty=4)

# add lowess smooth
lines(lowess(Bowley), col='red', lwd=2)

require(ggplot2, warn.conflicts=FALSE)
qplot(Year,Value, data=Bowley)+geom_smooth()



