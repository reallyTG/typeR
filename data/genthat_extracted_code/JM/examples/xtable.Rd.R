library(JM)


### Name: xtable
### Title: xtable Method from Joint Models.
### Aliases: xtable.jointModel
### Keywords: methods

### ** Examples

## Not run: 
##D require(xtable)
##D prothro$t0 <- as.numeric(prothro$time == 0)
##D lmeFit <- lme(pro ~ treat * (time + t0), random = ~ time | id, data = prothro)
##D survFit <- coxph(Surv(Time, death) ~ treat, data = prothros, x = TRUE)
##D jointFit <- jointModel(lmeFit, survFit, timeVar = "time", 
##D     method = "weibull-PH-aGH")
##D 
##D xtable(jointFit, math.style.negative = TRUE)
## End(Not run)



