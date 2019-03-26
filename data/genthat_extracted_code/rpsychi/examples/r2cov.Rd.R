library(rpsychi)


### Name: r2cov
### Title: Convert correlation matrix into covariance matrix
### Aliases: r2cov
### Keywords: array

### ** Examples
 
##data(iris) 
x <- iris[,1:4] 
cov(x)
r2cov(apply(x, 2, sd), cor(x)) 


##Toyoda (1998) p.34 
r2cov(sd = sqrt(c(.862, 1.089, 0.606)), 
      R = lower2R(c(.505, -0.077, -.233)))



