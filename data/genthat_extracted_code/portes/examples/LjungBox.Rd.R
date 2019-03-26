library(portes)


### Name: LjungBox
### Title: Ljung and Box Portmanteau Test
### Aliases: LjungBox
### Keywords: Portmanteau Test ts

### ** Examples

x <- rnorm(100)
LjungBox(x)                              ## univariate test
x <- cbind(rnorm(100),rnorm(100))
LjungBox(x)                              ## multivariate test      
##
##
## Annual flow of the river Nile at Aswan - 1871 to 1970
fit <- arima(Nile, c(1, 0, 1))
lags <- c(5, 10, 20)
## Apply the univariate test statistic on the fitted model 
LjungBox(fit, lags)            ## Correct (no need to specify order) 
LjungBox(fit, lags, order = 2) ## Correct 
## Apply the test statistic on the residuals and set order = 2 
res <- resid(fit)
LjungBox(res, lags)             ## Wrong (order is needed!)  
LjungBox(res, lags, order = 2)  ## Correct 
##
##
## Quarterly, west German investment, income, and consumption from 1960 Q1 to 1982 Q4 
data(WestGerman)
DiffData <- matrix(numeric(3 * 91), ncol = 3)
  for (i in 1:3) 
    DiffData[, i] <- diff(log(WestGerman[, i]), lag = 1)
fit <- ar.ols(DiffData, intercept = TRUE, order.max = 2)
lags <- c(5,10)
## Apply the test statistic on the fitted model 
LjungBox(fit,lags)                ## Correct (no need to specify order)
## Apply the test statistic on the residuals where order = 2
res <- ts((fit$resid)[-(1:2), ])
LjungBox(res,lags)                ## Wrong (order is needed!)  
LjungBox(res,lags,order = 2)      ## Correct 
##
##
## Monthly log stock returns of Intel corporation data: Test for ARCH Effects 
monthintel <- as.ts(monthintel)
LjungBox(monthintel)                         ## Usual test 
LjungBox(monthintel,squared.residuals=TRUE)  ## Test for ARCH effects
##
##
## Test for seasonality
## Accidental Deaths in the US 1973 - 1978
seasonal.arima <- arima(USAccDeaths, order = c(0,1,1), seasonal = list(order = c(0,1,1)))
LjungBox(seasonal.arima, lags = 5, season = 12)
## Quarterly U.K. economic time series from 1957 Q3 to 1967 Q4
cd <- EconomicUK[,1]
cd.fit <- arima(cd,order=c(0,1,0),seasonal=list(order=c(0,1,1),period=4))
LjungBox(cd.fit, lags = c(5,10), season = 4)
##
##
#### Write a function to fit a model: Apply portmanteau test on fitted obj with class "list"
## Example 1 
require("FitAR")
FitModel <- function(data){
    fit <- FitAR(z=data,p=2)
    p <- length(fit$phiHat)
    order <- p
    res <- fit$res 
 list(res=res,order=order)
}
Fit <- FitModel(Nile)
LjungBox(Fit) 
detach(package:FitAR)
##
## Example 2
require("TSA")
FitModel <- function(data){
    fit <- TSA::tar(y=log(data),p1=4,p2=4,d=3,a=0.1,b=0.9,print=FALSE)
    res <- ts(fit$std.res)
    p1 <- fit$p1
    p2 <- fit$p2
    order <- max(p1, p2)
    parSpec <- list(res=res,order=order)
  parSpec
}
data(prey.eq)
Fit <- FitModel(prey.eq)
LjungBox(Fit)
detach(package:TSA)
##
## Example 3
FitModel <- function(data){
    fit <- ar.ols(data, intercept = TRUE, order.max = 2)
    order <- 2
    res <- res <- ts((fit$resid)[-(1:2), ]) 
 list(res=res,order=order)
}
data(WestGerman)
DiffData <- matrix(numeric(3 * 91), ncol = 3)
  for (i in 1:3) 
    DiffData[, i] <- diff(log(WestGerman[, i]), lag = 1)
Fit <- FitModel(DiffData)
LjungBox(Fit) 



