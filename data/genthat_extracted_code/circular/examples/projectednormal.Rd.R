library(circular)


### Name: projected bivariate normal on the circle
### Title: Projected bivariate normal on the circle
### Aliases: dpnorm rpnorm
### Keywords: distribution

### ** Examples

data1 <- rpnorm(100, mu=c(0,0), sigma=diag(2),
  control.circular=list(units="degrees")) # Uniform on the circle
plot(data1)

ff <- function(x) dpnorm(x, mu=c(0,0), sigma=diag(2)) # Uniform on the circle
curve.circular(ff, join=TRUE,
  main="Density of a Projected Normal Distribution \n mu=(0,0), sigma=diag(2)")

ff <- function(x) dpnorm(x, mu=c(1,1), sigma=diag(2)) # Unimodal
curve.circular(ff, join=TRUE, xlim=c(-1, 2.3),
  main="Density of a Projected Normal Distribution \n mu=(1,1), sigma=diag(2)")

sigma <- matrix(c(1,0.9,0.9,1), nrow=2)  
ff <- function(x) dpnorm(x, mu=c(0.5,0.5), sigma=sigma) # Bimodal
curve.circular(ff, join=TRUE, xlim=c(-1, 2.3),
  main="Density of a Projected Normal Distribution \n mu=(0.5,0.5), rho=0.9")



