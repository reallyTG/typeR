library(ForecastCombinations)


### Name: Forecast_comb_all
### Title: All posible combinations forecast averaging
### Aliases: Forecast_comb_all

### ** Examples

library(MASS)
tt <- NROW(Boston)/2
TT <- NROW(Boston)
y <- Boston[1:tt, 14] # dependent variable is columns number 14
 # Create two sets of explanatory variables
 x1 <- Boston[1:tt, 1:6] # The first 6 explanatories
 x2 <- Boston[1:tt, 7:13]# The last 6 explanatories
# create two forecasts based on the two different x1 and x2
 coef1 <- lm(y ~ as.matrix(x1))$coef
 coef2 <- lm(y ~ as.matrix(x2))$coef
 f1 <- t(coef1 %*%  t(cbind(rep(1,tt), Boston[(tt+1):TT, 1:6] )))
 f2 <- t(coef2 %*% t(cbind(rep(1,tt), Boston[(tt+1):TT, 7:13] )))
 ff <- cbind(f1,f2)
 comb_all <- Forecast_comb_all(obs = Boston[(tt+1):TT, 14], fhat = ff)
 # To get the combined forecasts from the all subset regression:
 Combined_forecast <- apply(comb_all$pred, 1, mean)
# To get the combined forecasts based on aic criteria for example:
Combined_forecast_aic <- t(comb_all$aic %*% t(comb_all$pred))



