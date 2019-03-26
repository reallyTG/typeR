library(rcarbon)


### Name: plot.CalDates
### Title: Plot calibrated dates
### Aliases: plot.CalDates

### ** Examples

x <- calibrate(x=c(3402,3490,4042),errors=c(20,20,30))
plot(x) #display the first date
plot(x,2) #displays the second date
plot(x,3, calendar="BCAD", HPD=TRUE) #display in BC/AD with higher posterior density interval



