library(survAUC)


### Name: AUC.hc
### Title: AUC estimator proposed by Hung and Chiang
### Aliases: AUC.hc
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

AUC_hc <- AUC.hc(Surv.rsp, Surv.rsp.new, lpnew, times)
AUC_hc




