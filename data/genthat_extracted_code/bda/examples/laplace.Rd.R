library(bda)


### Name: laplace
### Title: The Laplace (Double Exponential) Distribution
### Aliases: dlap plap qlap rlap fitlap
### Keywords: distribution

### ** Examples


  dlap(100)
  x <- rlap(1000,mu=0, rate=0.5)
  x0 = seq(-7,7, length=100)
  fitlap(x)
  plot(density(x), xlim=c(-7,7), ylim=c(0,0.35))
  (out = fitlap(x))
  lines(dlap(x0, out$mu, out$rate)~x0, col=2, lty=2)
  (out = fitlap(x, mu=0))
  lines(dlap(x0, out$mu, out$rate)~x0, col=4, lty=2)



