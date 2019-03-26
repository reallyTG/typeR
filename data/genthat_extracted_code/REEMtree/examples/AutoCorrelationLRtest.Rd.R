library(REEMtree)


### Name: AutoCorrelationLRtest
### Title: Test for autocorrelation in the residuals of a RE-EM tree
### Aliases: AutoCorrelationLRtest
### Keywords: htest tree models

### ** Examples

data(simpleREEMdata)

# Estimation without autocorrelation
simpleEMresult<-REEMtree(Y~D+t+X, data=simpleREEMdata, random=~1|ID)
# Estimation with autocorrelation
simpleEMresult2<-REEMtree(Y~D+t+X, data=simpleREEMdata, random=~1|ID, correlation=corAR1())

# Autocorrelation test based on the first tree
AutoCorrelationLRtest(simpleEMresult, simpleREEMdata)
# Autocorrelation test based on the second tree
AutoCorrelationLRtest(simpleEMresult2, simpleREEMdata)
# Autocorrelation test with an alternative correlation structure
AutoCorrelationLRtest(simpleEMresult, simpleREEMdata, correlation=corCAR1())




