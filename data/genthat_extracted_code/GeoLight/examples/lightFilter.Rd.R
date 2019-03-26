library(GeoLight)


### Name: lightFilter
### Title: Filter to remove noise in light intensity measurements during
###   the night
### Aliases: lightFilter

### ** Examples

night <- rep(0,50); night[runif(4,0,50)] <- 10; night[runif(4,0,50)] <- -5
nightday <- c(night,rep(30,50))
plot(nightday,type="l",ylim=c(-5,30),ylab="light level",xlab="time (time)")
light2 <- lightFilter(nightday, baseline=0, iter=4)
lines(light2,col="red")
legend("bottomright",c("before","after"),lty=c(1,1),col=c("black","red"),bty="n")



