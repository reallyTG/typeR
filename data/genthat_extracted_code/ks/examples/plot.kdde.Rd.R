library(ks)


### Name: plot.kdde
### Title: Plot for kernel density derivative estimate
### Aliases: plot.kdde
### Keywords: hplot

### ** Examples

## univariate example
data(tempb)
fhat1 <- kdde(x=tempb[,"tmin"], deriv.order=1)   ## gradient [df/dx, df/dy]
plot(fhat1, xlab="Min. temp.")                   ## df/dx
points(20,predict(fhat1, x=20))

## bivariate example
fhat1 <- kdde(x=tempb[,c("tmin", "tmax")], deriv.order=1)
plot(fhat1, display="quiver")
  ## gradient [df/dx, df/dy]

## No test: 
fhat2 <- kdde(x=tempb[,c("tmin", "tmax")], deriv.order=2)
plot(fhat2, which.deriv.ind=2, display="persp", phi=15)
plot(fhat2, which.deriv.ind=2, display="filled.contour", col.fun=topo.colors)
  ## d^2 f/(dx dy): purple=-ve, green=zero, beige=+ve
s2 <- kcurv(fhat2)
plot(s2, display="filled.contour")
  ## summary curvature 
## End(No test)


