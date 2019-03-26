library(JMbayes)


### Name: xtable
### Title: xtable Method from Joint Models.
### Aliases: xtable.JMbayes
### Keywords: methods

### ** Examples

## Not run: 
##D prothro$t0 <- as.numeric(prothro$time == 0)
##D lmeFit <- lme(pro ~ treat * (time + t0), random = ~ time | id, data = prothro)
##D survFit <- coxph(Surv(Time, death) ~ treat, data = prothros, x = TRUE)
##D jointFit <- jointModelBayes(lmeFit, survFit, timeVar = "time")
##D     
##D if (require("xtable")) {
##D     xtable:::xtable(jointFit, math.style.negative = TRUE)
##D }
## End(Not run)



