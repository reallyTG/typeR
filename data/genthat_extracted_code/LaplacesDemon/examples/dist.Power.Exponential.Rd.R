library(LaplacesDemon)


### Name: dist.Power.Exponential
### Title: Power Exponential Distribution: Univariate Symmetric
### Aliases: dpe ppe qpe rpe
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- dpe(1,0,1,2)
x <- ppe(1,0,1,2)
x <- qpe(0.5,0,1,2)
x <- rpe(100,0,1,2)

#Plot Probability Functions
x <- seq(from=0.1, to=3, by=0.01)
plot(x, dpe(x,0,1,0.1), ylim=c(0,1), type="l", main="Probability Function",
     ylab="density", col="red")
lines(x, dpe(x,0,1,2), type="l", col="green")
lines(x, dpe(x,0,1,5), type="l", col="blue")
legend(1.5, 0.9, expression(paste(mu==0, ", ", sigma==1, ", ", kappa==0.1),
     paste(mu==0, ", ", sigma==1, ", ", kappa==2),
     paste(mu==0, ", ", sigma==1, ", ", kappa==5)),
     lty=c(1,1,1), col=c("red","green","blue"))



