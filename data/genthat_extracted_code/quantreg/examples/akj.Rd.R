library(quantreg)


### Name: akj
### Title: Density Estimation using Adaptive Kernel method
### Aliases: akj
### Keywords: smooth

### ** Examples

 set.seed(1)
 x <- c(rnorm(600), 2 + 2*rnorm(400))
 xx <- seq(-5, 8, length=200)
 z <- akj(x, xx)
 plot(xx, z$dens, ylim=range(0,z$dens), type ="l", col=2)
 abline(h=0, col="gray", lty=3)
 plot(xx, z$psi, type ="l", col=2, main = expression(hat(psi(x))))
 plot(xx, z$score, type ="l", col=2,
      main = expression("score " * hat(psi) * "'" * (x)))

 if(require("nor1mix")) {
  m3 <- norMix(mu= c(-4, 0, 3), sig2 = c(1/3^2, 1, 2^2),
               w = c(.1,.5,.4))
  plot(m3, p.norm = FALSE)
  set.seed(11)
  x <- rnorMix(1000, m3)
  z2 <- akj(x, xx)
  lines(xx, z2$dens, col=2)
  z3 <- akj(x, xx, kappa = 0.5, alpha = 0.88)
  lines(xx, z3$dens, col=3)
 }



