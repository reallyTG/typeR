library(survAUC)


### Name: predErr
### Title: Distance-based estimators of survival predictive accuracy
### Aliases: predErr
### Keywords: classif

### ** Examples


TR <- ovarian[1:16,]
TE <- ovarian[17:26,]
train.fit  <- coxph(Surv(futime, fustat) ~ age, x=TRUE, y=TRUE, 
                    method="breslow", data=TR)

lp <- predict(train.fit)
lpnew <- predict(train.fit, newdata=TE)
Surv.rsp <- Surv(TR$futime, TR$fustat)
Surv.rsp.new <- Surv(TE$futime, TE$fustat)
times <- 1:500                  

predErr(Surv.rsp, Surv.rsp.new, lp, lpnew, times, 
        type = "brier", int.type = "unweighted")

predErr(Surv.rsp, Surv.rsp.new, lp, lpnew, times, 
        type = "robust", int.type = "unweighted")

predErr(Surv.rsp, Surv.rsp.new, lp, lpnew, times, 
        type = "brier", int.type = "weighted")




