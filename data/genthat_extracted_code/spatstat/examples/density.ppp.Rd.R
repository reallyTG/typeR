library(spatstat)


### Name: density.ppp
### Title: Kernel Smoothed Intensity of Point Pattern
### Aliases: density.ppp
### Keywords: spatial methods smooth

### ** Examples

  if(interactive()) {
    opa <- par(mfrow=c(1,2))
    plot(density(cells, 0.05))
    plot(density(cells, 0.05, diggle=TRUE))
    par(opa)
    v <- diag(c(0.05, 0.07)^2)
    plot(density(cells, varcov=v))
  }
  ## No test: 
    Z <- density(cells, 0.05)
    Z <- density(cells, 0.05, diggle=TRUE)
    Z <- density(cells, 0.05, se=TRUE)
    Z <- density(cells, varcov=diag(c(0.05^2, 0.07^2)))
    Z <- density(cells, 0.05, weights=data.frame(a=1:42,b=42:1))
    Z <- density(cells, 0.05, weights=expression(x))
  
## End(No test)
  # automatic bandwidth selection
  plot(density(cells, sigma=bw.diggle(cells)))
  # equivalent:
  plot(density(cells, bw.diggle))
  # evaluate intensity at points
  density(cells, 0.05, at="points")

  plot(density(cells, sigma=0.4, kernel="epanechnikov"))

  # relative risk calculation by hand (see relrisk.ppp)
  lung <- split(chorley)$lung
  larynx <- split(chorley)$larynx
  D <- density(lung, sigma=2)
  plot(density(larynx, sigma=2, weights=1/D))



