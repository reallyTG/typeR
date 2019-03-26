library(ELYP)


### Name: findU32
### Title: Find the Wilks Confidence Interval Upper Bound from the Given
###   Empirical Likelihood Ratio Function
### Aliases: findU32
### Keywords: nonparametric htest

### ** Examples

## Here Mulam is the value of int g(t) d H(t) = Mulam
## For example g(t) = I[ t <= 2.0 ]; look inside myLLfun(). 

data(GastricCancer)

# The following will take about 0.5 min to run.
# findU32(NPmle=c(1.816674, -1.002082), ConfInt=c(1.2, 0.5, 10),   
#            LogLikfn=myLLfun, Pfun=Pfun, dataMat=GastricCancer)




