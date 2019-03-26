library(robfilter)


### Name: adore.filter
### Title: A Robust Adaptive Online Repeated Median Filter for Univariate
###   Time Series
### Aliases: adore.filter
### Keywords: robust smooth ts

### ** Examples

# # # # # # # # # #
# Short and noise-free time series
series <- c(rep(0,30),rep(10,30),seq(10,5,length=20),seq(5,15,length=20))

# Adaptive online signal extraction without & with 'restrict to range' rule
t.without.rtr <- adore.filter(series, rtr=0)
plot(t.without.rtr)
t.with.rtr1 <- adore.filter(series, rtr=1)
lines(t.with.rtr1$level, col="blue")
t.with.rtr2 <- adore.filter(series)
lines(t.with.rtr2$level, col="green3",lty=2)
legend("top",c("Signal with rtr=1","Signal with rtr=2"),col=c("blue","green3"),lty=c(1,2),bty="n")

# # # # # # # # # #
# Short and noise-free time series + 1 outlier
ol.series <- series
ol.series[63] <- 3

# Adaptive online signal extraction without & with 'restrict to range' rule
t.without.rtr <- adore.filter(ol.series, rtr=0)
plot(t.without.rtr)
t.with.rtr1 <- adore.filter(ol.series, rtr=1)
lines(t.with.rtr1$level, col="blue")
t.with.rtr2 <- adore.filter(ol.series)
lines(t.with.rtr2$level, col="green3",lty=2)
legend("top",c("Signal with rtr=1","Signal with rtr=2"),col=c("blue","green3"),lty=c(1,2),bty="n")

# # # # # # # # # #
# Noisy time series with level shifts, trend changes and shifts in the scale of the error term
true.signal  <- c(rep(0,150),rep(10,150),seq(10,5,length=100),seq(5,15,length=100))
series2      <- true.signal + c(rnorm(250,sd=1), rnorm(200,sd=3), rnorm(50,sd=1))

# Adaptive online signal extraction with additional Qn scale estimation
s2 <- adore.filter(series2, calc.qn=TRUE)
par(mfrow=c(3,1))
plot(s2)
plot(s2$sigma,type="l",main="Corresponding Qn Scale Estimation",ylab="sigma",xlab="time")
lines(c(rep(1,250),rep(3,200),rep(1,150)),col="grey")
legend("topleft",c("True scale","Qn"),lty=c(1,1),col=c("grey","black"),bty="n")
plot(s2$width,type="l",main="Corresponding Window Width",ylab="width",xlab="time")




