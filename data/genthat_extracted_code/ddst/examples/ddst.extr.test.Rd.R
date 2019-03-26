library(ddst)


### Name: ddst.extr.test
### Title: Data Driven Smooth Test for Extreme Value Distribution
### Aliases: ddst.extr.test ddst.extr.Nk
### Keywords: htest nonparametric

### ** Examples

library(evd)

# for given vector of 19 numbers
z = c(13.41, 6.04, 1.26, 3.67, -4.54, 2.92, 0.44, 12.93, 6.77, 10.09, 
   4.10, 4.04, -1.97, 2.17, -5.38, -7.30, 4.75, 5.63, 8.84)
ddst.extr.test(z, compute.p=TRUE)

# H0 is true
x = -qgumbel(runif(100),-1,1)
ddst.extr.test (x, compute.p = TRUE)

# H0 is false
x = rexp(80,4)
ddst.extr.test (x, compute.p = TRUE)




