library(addhazard)


### Name: predict.ah
### Title: Prediction Based on the Fitted Additive Hazards Model
### Aliases: predict.ah

### ** Examples

library(survival)
###  fit the additive hazards model to the data
nwts<- nwtsco[1:100,]
fit <- ah(Surv(trel,relaps) ~ age + instit, data = nwts,  ties = FALSE, robust = FALSE)

###  see the covariate names in the prediction function
fit$call
###  the newdata should be a dataframe
###  the variable names are the same as the covariate names in
###  the prediction function
newdata <- data.frame(age=60, instit =1)

###  an alternative way to give the newdata
newdata <- nwtsco[101,]

###  based on this subject's covariate values, the function predicts  individual specific
###  hazard rates at time points 3 and 5
predict(fit, newdata, newtime = c(3,5))



