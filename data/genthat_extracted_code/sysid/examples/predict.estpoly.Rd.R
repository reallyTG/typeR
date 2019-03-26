library(sysid)


### Name: predict.estpoly
### Title: Predictions of identified model
### Aliases: predict.estpoly

### ** Examples

data(arxsim)
mod1 <- oe(arxsim,c(2,1,1))
Yhat <- predict(mod1,arxsim) #  1-step ahead predictions 
Yhat_2 <- predict(mod1,arxsim,nahead=2) # 2-step ahead predictions
Yhat_inf <- predict(mod1,arxsim,nahead=Inf) # Infinite-step ahead predictions




