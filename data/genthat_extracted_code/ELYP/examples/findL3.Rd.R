library(ELYP)


### Name: findL3
### Title: Find the Wilks Confidence Interval Lower Bound from the Given
###   Empirical Likelihood Ratio Function
### Aliases: findL3
### Keywords: nonparametric htest

### ** Examples

## Here Mulam is the value of int g(t) d H(t) = Mulam
## For example g(t) = I[ t <= 2.0 ]; look inside myLLfun(). 

Pfun <- function(b1, b2, Mulam) {
alpha <- exp(-Mulam)
TrtCon <- 1/(alpha*exp(-b1) + (1-alpha)*exp(-b2))
return(TrtCon)
}

data(GastricCancer)

# The following will take about 10 sec. to run on i7 CPU.
# findL3(NPmle=c(1.816674, -1.002082), ConfInt=c(1.2, 0.5, 10),   
#           LogLikfn=myLLfun, Pfun=Pfun, dataMat=GastricCancer)




