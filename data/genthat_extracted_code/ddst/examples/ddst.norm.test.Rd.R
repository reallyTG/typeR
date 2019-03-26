library(ddst)


### Name: ddst.norm.test
### Title: Data Driven Smooth Test for Normality
### Aliases: ddst.norm.test tabNorm ddst.norm.Nk
### Keywords: htest nonparametric

### ** Examples


# for given vector of 19 numbers
z = c(13.41, 6.04, 1.26, 3.67, -4.54, 2.92, 0.44, 12.93, 6.77, 10.09, 
   4.10, 4.04, -1.97, 2.17, -5.38, -7.30, 4.75, 5.63, 8.84)
ddst.norm.test(z, compute.p=TRUE)

# H0 is true
z = rnorm(80)
ddst.norm.test(z, compute.p=TRUE)

# H0 is false
z = rexp(80,4)
ddst.norm.test(z, B=5000, compute.p=TRUE)




