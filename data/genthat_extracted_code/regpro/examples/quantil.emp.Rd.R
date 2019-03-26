library(regpro)


### Name: quantil.emp
### Title: Empirical p:th quantile
### Aliases: quantil.emp
### Keywords: smooth

### ** Examples

set.seed(2)
n<-100
y<-matrix(runif(n),n,1)
quantil.emp(y,p=0.05)



