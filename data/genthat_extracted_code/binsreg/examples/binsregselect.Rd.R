library(binsreg)


### Name: binsregselect
### Title: Data-driven IMSE-Optimal Partitioning/Binning Selection for
###   Binscatter
### Aliases: binsregselect

### ** Examples

 x <- runif(500); y <- sin(x)+rnorm(500)
 est <- binsregselect(y,x)
 summary(est)



