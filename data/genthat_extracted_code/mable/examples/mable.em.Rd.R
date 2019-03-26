library(mable)


### Name: mable.em
### Title: Fit raw data with the Bernstein polynomial model with a given
###   degree m
### Aliases: mable.em
### Keywords: ~distribution ~models ~nonparametric ~smooth

### ** Examples

## Old Faithful Data
  library(mixtools)
  x<-faithful$eruptions
  a<-0;  b<-7
  u<-seq(0,1,len=512); v<-(b-a)*u+a
  mu<-c(2,4.5); sig<-c(1,1)
  pmixem<-normalmixEM(x,.5,mu, sig)
  y1<-pmixem$lambda[1]*dnorm(v,pmixem$mu[1], pmixem$sigma[1])
      +pmixem$lambda[2]*dnorm(v,pmixem$mu[2],pmixem$sigma[2])
  mhat<-94 # preselected optimal degree m
  res<-mable.em(x, m=mhat, a, b, maxit=2000, eps=1.0e-4)
  hist(x, breaks=seq(0,7.5,len=20), xlim=c(0,7), ylim=c(0,.7), 
      probability =TRUE, xlab="t", ylab="f(t)", col ="light grey", 
      main="Histogram and Density of Duration of Old Faithful")
  lines(density(x, bw = "nrd0", adjust = 1), lty=4, col = 4, lwd=2)
  lines(v, bern.approx(u, p=res$phat)/(b-a), lty=1, col = 1, lwd=2)
  lines(v, y1, lty=5, col=3, lwd=2)
  legend(6,.4, lty=c(5,1,4), col=c(3,1,4), lwd=2, bty="n", 
      c(expression(hat(f)[P](t)), expression(hat(f)[B](t)), 
      expression(hat(f)[K](t))))



