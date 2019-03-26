library(emplik)


### Name: BJnoint
### Title: The Buckley-James censored regression estimator
### Aliases: BJnoint
### Keywords: nonparametric htest

### ** Examples

x <- matrix(c(rnorm(50,mean=1), rnorm(50,mean=2)), ncol=2,nrow=50)
## Suppose now we wish to test Ho: 2mu(1)-mu(2)=0, then
y <- 2*x[,1]-x[,2]
xx <- c(28,-44,29,30,26,27,22,23,33,16,24,29,24,40,21,31,34,-2,25,19)



