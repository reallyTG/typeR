library(mro)


### Name: mcr.test
### Title: Multiple Correlation Test of Significance
### Aliases: mcr.test

### ** Examples

## Example
library(MASS)
mu<-c(10,12,13,14)
sig<-matrix(0,4,4)
diag(sig)<-c(2,1,1,2)
da<-mvrnorm(25,mu,sig)
mcr.test(da,1,c(2:4))



