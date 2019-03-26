library(chillR)


### Name: interpolate_gaps_hourly
### Title: Interpolate gaps in hourly temperature records
### Aliases: interpolate_gaps_hourly
### Keywords: utility

### ** Examples



Winters_gaps<-make_JDay(Winters_hours_gaps[1:2000,])
colnames(Winters_gaps)[5:6]<-c("Temp","original_Temp")
interp<-interpolate_gaps_hourly(hourtemps=Winters_gaps,latitude=38.5)

#plot results: interpolated temperatures are shown in red, measured temperatures in black.
plot(interp$weather$Temp[1:120]~c(interp$weather$JDay[1:120]+
   interp$weather$Hour[1:120]/24),type="l",
   col="RED",lwd=2,xlab="JDay",ylab="Temperature")
lines(interp$weather$Temp_measured[1:120]~c(interp$weather$JDay[1:120]+
   interp$weather$Hour[1:120]/24),lwd=2)




