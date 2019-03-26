library(survAUC)


### Name: AUC.cd
### Title: AUC estimator proposed by Chambless and Diao
### Aliases: AUC.cd
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

AUC_CD <- AUC.cd(Surv.rsp, Surv.rsp.new, lp, lpnew, times)




