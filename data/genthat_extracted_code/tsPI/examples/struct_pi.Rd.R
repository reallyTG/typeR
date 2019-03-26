library(tsPI)


### Name: struct_pi
### Title: Prediction Intervals for Structural Time Series with Exogenous
###   Variables Using Importance Sampling
### Aliases: struct_pi

### ** Examples


pred_StructTS <- predict(StructTS(Nile, type ="level"), n.ahead = 10, se.fit = TRUE)
pred_StructTS <- cbind(pred = pred_StructTS$pred,
  lwr = pred_StructTS$pred - qnorm(0.975)*pred_StructTS$se,
 upr = pred_StructTS$pred + qnorm(0.975)*pred_StructTS$se)

set.seed(123)
pred <- struct_pi(Nile, type = "level", n_ahead = 10)

ts.plot(ts.union(Nile,pred_StructTS, pred[,1:3]), col = c(1,2,2,2,3,3,3),
  lty = c(1,1,2,2,1,2,2))





