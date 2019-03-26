library(smooth)


### Name: msarima
### Title: Multiple Seasonal ARIMA
### Aliases: msarima
### Keywords: models nonlinear regression smooth ts univar

### ** Examples


# The previous one is equivalent to:
ourModel <- msarima(rnorm(118,100,3),orders=c(1,1,1),lags=1,h=18,holdout=TRUE,intervals="p")

# Example of SARIMA(2,0,0)(1,0,0)[4]
msarima(rnorm(118,100,3),orders=list(ar=c(2,1)),lags=c(1,4),h=18,holdout=TRUE)

# SARIMA of a peculiar order on AirPassengers data with Fisher Information
ourModel <- msarima(AirPassengers,orders=list(ar=c(1,0,3),i=c(1,0,1),ma=c(0,1,2)),
                    lags=c(1,6,12),h=10,holdout=TRUE,FI=TRUE)

# Construct the 95% confidence intervals for the parameters of the model
ourCoefs <- coef(ourModel)
ourCoefsSD <- sqrt(abs(diag(solve(ourModel$FI))))
# Sort values accordingly
ourCoefs <- ourCoefs[names(ourCoefsSD)]
ourConfInt <- cbind(ourCoefs + qt(0.025,nobs(ourModel)) * ourCoefsSD,
                    ourCoefs + qt(0.975,nobs(ourModel)) * ourCoefsSD)
colnames(ourConfInt) <- c("2.25%","97.5%")
ourConfInt

# ARIMA(1,1,1) with Mean Squared Trace Forecast Error
msarima(rnorm(118,100,3),orders=list(ar=1,i=1,ma=1),lags=1,h=18,holdout=TRUE,cfType="TMSE")

msarima(rnorm(118,100,3),orders=list(ar=1,i=1,ma=1),lags=1,h=18,holdout=TRUE,cfType="aTMSE")

# SARIMA(0,1,1) with exogenous variables with crazy estimation of xreg
ourModel <- msarima(rnorm(118,100,3),orders=list(i=1,ma=1),h=18,holdout=TRUE,
                    xreg=c(1:118),updateX=TRUE)

summary(ourModel)
forecast(ourModel)
plot(forecast(ourModel))




