library(imputeTS)


### Name: na.kalman
### Title: Missing Value Imputation by Kalman Smoothing and State Space
###   Models
### Aliases: na.kalman

### ** Examples

#Example 1: Perform imputation with KalmanSmoother and state space representation of arima model
na.kalman(tsAirgap)

#Example 2: Perform imputation with KalmanRun and state space representation of arima model
na.kalman(tsAirgap, smooth = FALSE)

#Example 3: Perform imputation with KalmanSmooth and StructTS model
na.kalman(tsAirgap, model ="StructTS", smooth = TRUE) 

#Example 4: Perform imputation with KalmanSmooth and StructTS model with additional parameters 
na.kalman(tsAirgap, model ="StructTS", smooth = TRUE, type ="trend") 

#Example 5:  Perform imputation with KalmanSmooth and user created model
usermodel <- arima(tsAirgap,order = c(1,0,1))$model
na.kalman(tsAirgap,model = usermodel)

#Example 6: Same as example 1, just written with pipe operator
tsAirgap %>% na.kalman




