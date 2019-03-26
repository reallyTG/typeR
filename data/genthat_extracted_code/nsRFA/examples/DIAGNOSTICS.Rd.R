library(nsRFA)


### Name: DIAGNOSTICS
### Title: Diagnostics of models
### Aliases: DIAGNOSTICS R2 RMSE MAE RMSEP MAEP
### Keywords: models

### ** Examples

data(hydroSIMN)

datregr <- parameters
regr0 <- lm(Dm ~ .,datregr); summary(regr0)
regr1 <- lm(Dm ~ Am + Hm + Ybar,datregr); summary(regr1)

obs <- parameters[,"Dm"]
est0 <- regr0$fitted.values
est1 <- regr1$fitted.values

R2(obs, est0)
R2(obs, est1)

RMSE(obs, est0)
RMSE(obs, est1)

MAE(obs, est0)
MAE(obs, est1)

RMSEP(obs, est0)
RMSEP(obs, est1)

MAEP(obs, est0)
MAEP(obs, est1)



