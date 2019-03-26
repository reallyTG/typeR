library(binsreg)


### Name: binsregtest
### Title: Data-driven Nonparametric Shape Restriction and Parametric Model
###   Specification Testing using Binscatter
### Aliases: binsregtest

### ** Examples

 x <- runif(500); y <- sin(x)+rnorm(500)
 est <- binsregtest(y,x, testmodelpoly=1)
 summary(est)



