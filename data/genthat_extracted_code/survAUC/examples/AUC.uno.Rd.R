library(survAUC)


### Name: AUC.uno
### Title: AUC estimator proposed by Uno et al.
### Aliases: AUC.uno spec.uno sens.uno
### Keywords: classif

### ** Examples


TR <- ovarian[1:16,]
TE <- ovarian[17:26,]
train.fit  <- coxph(Surv(futime, fustat) ~ age,
                    x=TRUE, y=TRUE, method="breslow", data=TR)

lpnew <- predict(train.fit, newdata=TE)
Surv.rsp <- Surv(TR$futime, TR$fustat)
Surv.rsp.new <- Surv(TE$futime, TE$fustat)
times <- seq(10, 1000, 10)                  

AUC_Uno <- AUC.uno(Surv.rsp, Surv.rsp.new, lpnew, times)
names(AUC_Uno)
AUC_Uno$iauc




