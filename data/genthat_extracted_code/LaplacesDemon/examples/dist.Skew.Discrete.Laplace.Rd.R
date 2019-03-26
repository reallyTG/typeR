library(LaplacesDemon)


### Name: dist.Skew.Discrete.Laplace
### Title: Skew Discrete Laplace Distribution: Univariate
### Aliases: dsdlaplace psdlaplace qsdlaplace rsdlaplace
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- dsdlaplace(1,0.5,0.5)
x <- psdlaplace(1,0.5,0.5)
x <- qsdlaplace(0.5,0.5,0.5)
x <- rsdlaplace(5,0.5,0.5)

#Plot Probability Functions
     x <- c(-3:3)
     plot(x, dsdlaplace(x,0.5,0.5), ylim=c(0,0.6), type="l", main="Probability Function",
          ylab="density", col="red")
     lines(x, dsdlaplace(x,0.3,0.6), type="l", col="green")
     lines(x, dsdlaplace(x,0.9,0.1), type="l", col="blue")
     legend(-2.5, 0.5, expression(paste(p==0.5, ", ", q==0.5),
          paste(p==0.3, ", ", q==0.6),
          paste(p==0.9, ", ", q==0.1)),
          lty=c(1,1,1), col=c("red","green","blue"))



