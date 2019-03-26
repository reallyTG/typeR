library(multivariance)


### Name: m.multivariance
### Title: m distance multivariance
### Aliases: m.multivariance

### ** Examples

x = matrix(rnorm(3*30),ncol = 3)

# the following values are identical
m.multivariance(x,m =2)
1/choose(3,2)*(multivariance(x[,c(1,2)]) +
               multivariance(x[,c(1,3)]) +
               multivariance(x[,c(2,3)]))

# the following values are identical
m.multivariance(x,m=3)
multivariance(x)

# the following values are identical
1/4*(3*(m.multivariance(x,m=2)) + m.multivariance(x,m=3))
total.multivariance(x, Nscale = TRUE)
1/4*(multivariance(x[,c(1,2)], Nscale = TRUE) +
     multivariance(x[,c(1,3)], Nscale = TRUE) +
     multivariance(x[,c(2,3)], Nscale = TRUE) + multivariance(x, Nscale = TRUE))




