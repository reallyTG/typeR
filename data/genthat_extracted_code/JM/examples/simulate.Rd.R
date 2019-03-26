library(JM)


### Name: simulate
### Title: Simulate from Joint Models.
### Aliases: simulateJM simulate.jointModel
### Keywords: methods

### ** Examples

## Not run: 
##D prothro$t0 <- as.numeric(prothro$time == 0)
##D lmeFit <- lme(pro ~ treat * (time + t0), random = ~ time | id, data = prothro)
##D survFit <- coxph(Surv(Time, death) ~ treat, data = prothros, x = TRUE)
##D jointFit <- jointModel(lmeFit, survFit, timeVar = "time", 
##D     method = "weibull-PH-aGH")
##D 
##D newData <- simulate(jointFit, nsim = 1, times = seq(0, 11, len = 15))
##D newData
## End(Not run)



