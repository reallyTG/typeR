library(survAUC)


### Name: AUC.sh
### Title: AUC estimator proposed by Song and Zhou
### Aliases: AUC.sh spec.sh sens.sh
### Keywords: classif

### ** Examples


TR <- ovarian[1:16,]
TE <- ovarian[17:26,]
train.fit  <- coxph(Surv(futime, fustat) ~ age,
                    x=TRUE, y=TRUE, method="breslow", data=TR)

lp <- predict(train.fit)
lpnew <- predict(train.fit, newdata=TE)
Surv.rsp <- Surv(TR$futime, TR$fustat)
Surv.rsp.new <- Surv(TE$futime, TE$fustat)
times <- seq(10, 1000, 10)                  

AUC_sh <- AUC.sh(Surv.rsp, Surv.rsp.new, lp, lpnew, times)
names(AUC_sh)
AUC_sh$iauc




