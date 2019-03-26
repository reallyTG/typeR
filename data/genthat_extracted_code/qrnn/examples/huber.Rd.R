library(qrnn)


### Name: huber
### Title: Huber norm and Huber approximations to the ramp and tilted
###   absolute value functions
### Aliases: huber huber.prime hramp hramp.prime tilted.approx
###   tilted.approx.prime

### ** Examples

x <- seq(-10, 10, length=100)
plot(x, huber(x, eps=1), type="l", col="black", ylim=c(-2, 10), ylab="")
lines(x, hramp(x, lower=0, eps=1), col="red")
lines(x, tilted.approx(x, tau=0.1, eps=1), col="blue")
lines(x, huber.prime(x, eps=1), col="black", lty=2)
lines(x, hramp.prime(x, lower=0, eps=1), lty=2, col="red")
lines(x, tilted.approx.prime(x, tau=0.1, eps=1), lty=2, col="blue")



