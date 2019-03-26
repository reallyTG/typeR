library(proportion)


### Name: empericalBAx
### Title: The empirical Bayesian approach for Beta-Binomial model given x
### Aliases: empericalBAx

### ** Examples

sL=runif(1,0,2)				#Lower and upper of Support for MLE optimization
sU=runif(1,sL,10)
x=0; n= 5; alp=0.05
empericalBAx(x,n,alp,sL,sU) 



