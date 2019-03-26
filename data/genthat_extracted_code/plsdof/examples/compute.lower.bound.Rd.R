library(plsdof)


### Name: compute.lower.bound
### Title: Lower bound for the Degrees of Freedom
### Aliases: compute.lower.bound
### Keywords: math

### ** Examples

# Boston Housing data
library(MASS)
data(Boston)
X<-Boston[,-14]
my.lower<-compute.lower.bound(X)



