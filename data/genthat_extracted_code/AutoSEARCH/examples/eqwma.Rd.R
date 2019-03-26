library(AutoSEARCH)


### Name: eqwma
### Title: Equally Weighted Moving Average (EqWMA) of the pth.
###   exponentiated values
### Aliases: eqwma leqwma
### Keywords: Statistical Models Time Series Financial Econometrics

### ** Examples

##generate an iid normal series:
set.seed(123)
x <- rnorm(100)

##compute lag of EqWMA(20) for x^2:
eqwma(x, p=2)

##compute lag of EqWMA(5) and lag of EqWMA(10) for x:
eqwma(x, length=c(5,10))

##compute lag of log(EqWMA(20)) for x^2:
leqwma(x)

#compute lag of log(EqWMA(5)) and lag of log(EqWMA(8))
#for abs(x)^2:
leqwma(x, length=c(4,8))




