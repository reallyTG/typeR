library(anoint)


### Name: anoint.fit
### Title: Fits and global tests of analysis of interaction models
### Aliases: anoint.fit anoint.fit-class

### ** Examples


# NO INTERACTION CONDITION, LOGISTIC MODEL

null.interaction <- data.anoint(
                             alpha = c(log(.5),log(.5*.75)),
                             beta = log(c(1.5,2)),
                             gamma = rep(1,2),
                             mean = c(0,0),
                             vcov = diag(2),
                             type="survival", n = 500
                             )

object <- anoint(Surv(y, event)~(V1+V2)*trt,data=null.interaction,family="coxph")

fit <- anoint.fit(object)

summary(fit)

fits(fit,type="obo")



