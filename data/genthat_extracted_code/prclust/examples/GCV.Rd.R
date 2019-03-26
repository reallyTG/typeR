library(prclust)


### Name: GCV
### Title: Calculate the Generalized Cross-Validation Statistic (GCV)
### Aliases: GCV
### Keywords: GCV

### ** Examples

set.seed(1)
library("prclust")
data = matrix(NA,2,50)
data[1,1:25] = rnorm(25,0,0.33)
data[2,1:25] = rnorm(25,0,0.33)
data[1,26:50] = rnorm(25,1,0.33)
data[2,26:50] = rnorm(25,1,0.33)

#case 1
gcv1 = GCV(data,lambda1=1,lambda2=1,tau=0.5,sigma=0.25,B =10)
gcv1

#case 2
gcv2 = GCV(data,lambda1=1,lambda2=0.7,tau=0.3,sigma=0.25,B = 10)
gcv2

# Note that the combination of tuning parameters in case 1 are better than 
# the combination of tuning parameters in case 2 since the value of GCV in case 1 is
# less than the value in case 2.



