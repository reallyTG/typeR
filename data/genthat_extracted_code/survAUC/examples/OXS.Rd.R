library(survAUC)


### Name: OXS
### Title: R2-type coefficients for Cox proportional hazards models
### Aliases: OXS Nagelk XO
### Keywords: classif

### ** Examples


TR <- ovarian[1:16,]
TE <- ovarian[17:26,]
train.fit  <- coxph(Surv(futime, fustat) ~ age,
                    x=TRUE, y=TRUE, method="breslow", data=TR)

model0 <- coxph(Surv(futime, fustat)~1, data=TR)
model1 <- coxph(Surv(futime, fustat)~age, data=TR)
f0 <- rep(0,nrow(TE))
f1 <- predict(model1, newdata=TE)               
Surv.res <- Surv(TE$futime, TE$fustat)

OXS(Surv.res, f1, f0)
Nagelk(Surv.res, f1, f0)
XO(Surv.res, f1, f0)




