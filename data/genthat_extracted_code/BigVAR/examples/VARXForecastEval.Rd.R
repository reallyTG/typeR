library(BigVAR)


### Name: VARXForecastEval
### Title: Evaluate forecasts from a VAR or VARX with lag orders selected
###   by AIC/BIC
### Aliases: VARXForecastEval

### ** Examples

data(Y)

# Evaluate the performance of a VAR with lags selected by BIC.
p <- 4
T1 <- floor(nrow(Y))/3
T2 <- floor(2*nrow(Y))/3
# Matrix of zeros for X
X <- matrix(0,nrow=nrow(Y),ncol=ncol(Y))
BICMSFE <- VARXForecastEval(Y,X,p,0,T1,T2,"BIC",1)




