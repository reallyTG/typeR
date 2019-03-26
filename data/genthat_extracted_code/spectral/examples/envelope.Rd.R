library(spectral)


### Name: envelope
### Title: Calculates the envelope of a band limited signal
### Aliases: envelope

### ** Examples

## noisy signal with amplitude modulation
x <- seq(0,1, length.out=2e2)

# original data
y <- (abs(x-0.5))*sin(20*2*pi*x)

ye <- base::Re(envelope(y))

# plot results
plot(x,y,type="l",lwd=1,col="darkgrey",lty=2,ylab="y",main="Spectral filtering")
lines(x,ye)
legend("bottomright",c("modulated","envelope"),col=c("grey","black"),lty=c(2,1))



