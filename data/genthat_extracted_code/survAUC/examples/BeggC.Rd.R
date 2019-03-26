library(survAUC)


### Name: BeggC
### Title: C-statistic by Begg et al.
### Aliases: BeggC
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

Cstat <- BeggC(Surv.rsp, Surv.rsp.new, lp, lpnew)
Cstat




