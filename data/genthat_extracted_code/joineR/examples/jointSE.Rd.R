library(joineR)


### Name: jointSE
### Title: Standard errors via bootstrap for a joint model fit
### Aliases: jointSE
### Keywords: htest models survival

### ** Examples

data(heart.valve)
heart.surv <- UniqueVariables(heart.valve, 
                              var.col = c("fuyrs", "status"), 
                              id.col = "num")
heart.long <- heart.valve[, c("num", "time", "log.lvmi")]
heart.cov <- UniqueVariables(heart.valve, 
                             c("age", "hs", "sex"), 
                             id.col = "num")
heart.valve.jd <- jointdata(longitudinal = heart.long, 
                            baseline = heart.cov, 
                            survival = heart.surv, 
                            id.col = "num", 
                            time.col = "time")
fit <- joint(heart.valve.jd, 
             long.formula = log.lvmi ~ 1 + time + hs, 
             surv.formula = Surv(fuyrs, status) ~ hs, 
             model = "int")
jointSE(fitted = fit, n.boot = 1)



