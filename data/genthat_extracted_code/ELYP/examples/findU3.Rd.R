library(ELYP)


### Name: findU3
### Title: Find the Wilks Confidence Interval Upper Bound from the Given
###   Empirical Likelihood Ratio Function
### Aliases: findU3
### Keywords: nonparametric htest

### ** Examples

## Here Mulam is the value of int g(t) d H(t) = Mulam
## For example g(t) = I[ t <= 2.0 ]; look inside myLLfun(). 

data(GastricCancer)

# The following will take about 10 sec. to run on an i7-4690 CPU.
# findU3(NPmle=c(1.816674, -1.002082), ConfInt=c(1.2, 0.5, 10),   
#          LogLikfn=myLLfun, Pfun=Pfun, dataMat=GastricCancer)




