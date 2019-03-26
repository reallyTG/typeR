library(proportion)


### Name: empericalBA
### Title: The empirical Bayesian approach for Beta-Binomial model
### Aliases: empericalBA

### ** Examples

sL=runif(1,0,2)				#Lower and upper of Support for MLE optimization
sU=runif(1,sL,10)
n= 5; alp=0.05
empericalBA(n,alp,sL,sU) 



