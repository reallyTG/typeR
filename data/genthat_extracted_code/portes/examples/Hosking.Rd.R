library(portes)


### Name: Hosking
### Title: The Modified Multivariate Portmanteau Test, Hosking (1980)
### Aliases: Hosking
### Keywords: Portmanteau Test

### ** Examples

x <- rnorm(100)
Hosking(x)                              ## univariate test
x <- cbind(rnorm(100),rnorm(100))
Hosking(x)                              ## multivariate test
##
##
## Quarterly, west German investment, income, and consumption from 1960 Q1  to 1982 Q4 
data(WestGerman)
DiffData <- matrix(numeric(3 * 91), ncol = 3)
  for (i in 1:3) 
    DiffData[, i] <- diff(log(WestGerman[, i]), lag = 1)
fit <- ar.ols(DiffData, intercept = TRUE, order.max = 2)
lags <- c(5,10)
## Apply the test statistic on the fitted model (order will be automatically applied)
Hosking(fit,lags,order = 2)                          ## Correct (no need to specify order)
Hosking(fit,lags)                                    ## Correct
## Apply the test statistic on the residuals
res <- ts((fit$resid)[-(1:2), ])
Hosking(res,lags,order = 2)                          ## Correct
Hosking(res,lags)                                    ## Wrong (order is needed!)  
##
##
## Write a function to fit a model: Apply portmanteau test on fitted obj with class "list"
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
Hosking(Fit) 



