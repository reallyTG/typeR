library(MHTcop)


### Name: ac_fdr.test
### Title: Perform a FDR controlling test on marginal p-values that are
###   distributed according to an Archmidean copula
### Aliases: ac_fdr.test

### ** Examples

#(Using p-values generated from the model (16))
library(copula)
set.seed(1)
m <- 20
m0 <- 0.8*m
p_values <- rCopula(1,onacopulaL(copClayton,list(1,1:20)))
mu<-runif(m-m0, min=-1, max=-1/2)
p_values[1,(m0+1):m]<-pnorm(sqrt(m)*mu+qnorm(p_values[(m0+1):m]),0,1)
ac_fdr.test(p_values,setTheta(copClayton,1),m0,0.05,1e4)$test



