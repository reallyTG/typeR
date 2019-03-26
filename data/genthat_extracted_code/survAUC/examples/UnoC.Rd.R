library(survAUC)


### Name: UnoC
### Title: C-statistic by Uno et al.
### Aliases: UnoC
### Keywords: classif

### ** Examples


TR <- ovarian[1:16,]
TE <- ovarian[17:26,]
train.fit  <- coxph(Surv(futime, fustat) ~ age,
                    x=TRUE, y=TRUE, method="breslow", data=TR)

lpnew <- predict(train.fit, newdata=TE)
Surv.rsp <- Surv(TR$futime, TR$fustat)
Surv.rsp.new <- Surv(TE$futime, TE$fustat)              

Cstat <- UnoC(Surv.rsp, Surv.rsp.new, lpnew)
Cstat




