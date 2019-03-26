library(mgcv)


### Name: ldTweedie
### Title: Log Tweedie density evaluation
### Aliases: ldTweedie
### Keywords: models regression

### ** Examples

  library(mgcv)
  ## convergence to Poisson illustrated
  ## notice how p>1.1 is OK
  y <- seq(1e-10,10,length=1000)
  p <- c(1.0001,1.001,1.01,1.1,1.2,1.5,1.8,2)
  phi <- .5
  fy <- exp(ldTweedie(y,mu=2,p=p[1],phi=phi)[,1])
  plot(y,fy,type="l",ylim=c(0,3),main="Tweedie density as p changes")
  for (i in 2:length(p)) {
    fy <- exp(ldTweedie(y,mu=2,p=p[i],phi=phi)[,1])
    lines(y,fy,col=i)
  }





