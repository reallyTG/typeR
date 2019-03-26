library(survAUC)


### Name: plot.survAUC
### Title: Plot method for survAUC and survErr Objects
### Aliases: plot.survAUC plot.survErr
### Keywords: hplot classif

### ** Examples

TR <- ovarian[1:16,]
TE <- ovarian[17:26,]
train.fit  <- coxph(Surv(futime, fustat) ~ age,
                    x=TRUE, y=TRUE, method="breslow", data=TR)

lp <- predict(train.fit)
lpnew <- predict(train.fit, newdata=TE)
Surv.rsp <- Surv(TR$futime, TR$fustat)
Surv.rsp.new <- Surv(TE$futime, TE$fustat)
times <- seq(10, 600, 10)                  

AUC_sh <- AUC.sh(Surv.rsp, Surv.rsp.new, lp, lpnew, times)
plot(AUC_sh)
abline(h = 0.5)

BrierScore <- predErr(Surv.rsp, Surv.rsp.new, lp, lpnew, times, 
                      type = "brier", int.type = "weighted")
plot(BrierScore)
abline(h = 0.25)




