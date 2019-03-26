library(emplik)


### Name: el.test
### Title: Empirical likelihood ratio test for the means, uncensored data
### Aliases: el.test
### Keywords: nonparametric htest

### ** Examples

x <- matrix(c(rnorm(50,mean=1), rnorm(50,mean=2)), ncol=2,nrow=50)
el.test(x, mu=c(1,2))
## Suppose now we wish to test Ho: 2mu(1)-mu(2)=0, then
y <- 2*x[,1]-x[,2]
el.test(y, mu=0)
xx <- c(28,-44,29,30,26,27,22,23,33,16,24,29,24,40,21,31,34,-2,25,19)
el.test(xx, mu=15)  #### -2LLR = 1.805702



