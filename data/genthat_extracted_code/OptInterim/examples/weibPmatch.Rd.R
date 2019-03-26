library(OptInterim)


### Name: weibPmatch
### Title: Compute the shape or scale parameter for a Weibull distribution
###   so it has a specified event-free rate at a specified time.
### Aliases: weibPmatch
### Keywords: hplot

### ** Examples



param <- c(1, 1.09, 2, 1.40)
x<-1

p0<-pweibull(x,param[1],param[2],lower=FALSE)
p1<-pweibull(x,param[3],param[4],lower=FALSE)

weibull.plot(param,x)

### equivalent to simple call
paramNew<-c(param[1], weibPmatch(x,p0,param[1]), param[3], weibPmatch(x,p1,param[3]))
weibull.plot(paramNew, x)

### null curve with different shape
paramNew<-c(3.0, weibPmatch(x,p0,3.0), param[3], weibPmatch(x,p1,param[3]))
weibull.plot(paramNew, x)

### alternative curve with different scale
paramNew<-c(param[1], param[2], weibPmatch(x,p1,scale=2), 2)
weibull.plot(paramNew, x)




