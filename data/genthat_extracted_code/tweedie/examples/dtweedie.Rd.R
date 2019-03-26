library(tweedie)


### Name: Tweedie
### Title: Tweedie Distributions
### Aliases: dtweedie dtweedie.series dtweedie.inversion dtweedie.stable
###   ptweedie ptweedie.series ptweedie.inversion qtweedie rtweedie
### Keywords: models

### ** Examples

### Plot a Tweedie density
power <- 2.5
mu <- 1 
phi <- 1 
y <- seq(0, 6, length=500) 
fy <- dtweedie( y=y, power=power, mu=mu, phi=phi) 
plot(y, fy, type="l", lwd=2, ylab="Density")
# Compare to the saddlepoint density
f.saddle <- dtweedie.saddle( y=y, power=power, mu=mu, phi=phi) 
lines( y, f.saddle, col=2 )
legend("topright", col=c(1,2), lwd=c(2,1),
    legend=c("Actual","Saddlepoint") )

### A histogram of Tweedie random numbers
hist( rtweedie( 1000, power=1.2, mu=1, phi=1) )

### An example of the multimodal feature of the Tweedie
### family with power near 1 (from Dunn and Smyth, 2005).
y <- seq(0.001,2,len=1000)
mu <- 1
phi <- 0.1
p <- 1.02
f1 <- dtweedie(y,mu=mu,phi=phi,power=p)
plot(y, f1, type="l", xlab="y", ylab="Density")
p <- 1.05
f2<- dtweedie(y,mu=mu,phi=phi,power=p)
lines(y,f2, col=2)

### Compare series and saddlepoint methods
y <- seq(0.001,2,len=1000)
mu <- 1
phi <- 0.1
p <- 1.02
f.series <- dtweedie.series( y,mu=mu,phi=phi,power=p )
f.saddle <- dtweedie.saddle( y,mu=mu,phi=phi,power=p )

f.all <- c( f.series, f.saddle )
plot( range(f.all) ~ range( y ), xlab="y", ylab="Density", 
  type="n")
lines( f.series ~ y, lty=1, col=1)
lines( f.saddle ~ y, lty=3, col=3)

legend("topright", lty=c(1,3), col=c(1,3),
  legend=c("Series","Saddlepoint") )




