library(prclust)


### Name: stability
### Title: Calculate the stability based statistics
### Aliases: stability
### Keywords: stability

### ** Examples

set.seed(1)
library("prclust")
data = matrix(NA,2,50)
data[1,1:25] = rnorm(25,0,0.33)
data[2,1:25] = rnorm(25,0,0.33)
data[1,26:50] = rnorm(25,1,0.33)
data[2,26:50] = rnorm(25,1,0.33)

#case 1
stab1 = stability(data,rho=1,lambda=1,tau=0.5,n.times = 2)
stab1

#case 2
stab2 = stability(data,rho=1,lambda=0.7,tau=0.3,n.times = 2)
stab2
# Note that the combination of tuning parameters in case 1 are better than 
# the combination of tuning parameters in case 2 since the value of GCV in case 1 is
# less than the value in case 2.



