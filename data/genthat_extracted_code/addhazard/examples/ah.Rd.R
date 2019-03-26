library(addhazard)


### Name: ah
### Title: Fit Additive Hazards Regression Models
### Aliases: ah

### ** Examples

library(survival)
### using the first 100 rows in nwtsco to build an additive hazards model
nwts<- nwtsco[1:100,]

### fit the additive hazards model to the data
### the model-based standard errors are reported when setting robust = FALSE
fit1 <- ah(Surv(trel,relaps) ~ age + instit, ties = FALSE, data = nwts, robust = FALSE)
summary(fit1)

### fit the additive hazards model to the data with robust standard errors
fit2 <- ah(Surv(trel,relaps) ~ age + instit, ties = FALSE, data = nwts, robust = TRUE)
summary(fit2)

### when there are ties, break the ties first
nwts_all <- nwtsco
nwts_all$trel <- nwtsco$trel + runif(dim(nwts_all)[1],0,1)*1e-8
fit3 <- ah(Surv(trel,relaps) ~ age + instit, ties = FALSE, data = nwts_all, robust = TRUE)
summary(fit3)



