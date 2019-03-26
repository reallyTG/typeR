library(tsPI)


### Name: arima_pi
### Title: Prediction Intervals for ARIMA Processes with Exogenous
###   Variables Using Importance Sampling
### Aliases: arima_pi

### ** Examples


set.seed(123)
x <- arima.sim(n = 30, model = list(ar = 0.9))

pred_arima <- predict(arima(x, order = c(1,0,0)), n.ahead = 10, se.fit = TRUE)
pred_arima <- cbind(pred = pred_arima$pred,
  lwr = pred_arima$pred - qnorm(0.975)*pred_arima$se,
  upr = pred_arima$pred + qnorm(0.975)*pred_arima$se)

pred <- arima_pi(x, order = c(1,0,0), n_ahead = 10)

ts.plot(ts.union(x,pred_arima, pred[,1:3]), col = c(1,2,2,2,3,3,3),
  lty = c(1,1,2,2,1,2,2))




