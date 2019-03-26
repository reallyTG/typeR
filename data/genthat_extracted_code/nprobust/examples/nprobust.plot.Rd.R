library(nprobust)


### Name: nprobust.plot
### Title: Graphical Presentation of Results from 'nprobust' Package.
### Aliases: nprobust.plot

### ** Examples

x   <- runif(500) 
y   <- sin(4*x) + rnorm(500)
est <- lprobust(y,x)
nprobust.plot(est)



