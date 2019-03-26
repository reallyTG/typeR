library(JMbayes)


### Name: prederrJM
### Title: Prediction Errors for Joint Models
### Aliases: prederrJM prederrJM.JMbayes prederrJM.mvJMbayes
### Keywords: methods

### ** Examples

## Not run: 
##D # we construct the composite event indicator (transplantation or death)
##D pbc2$status2 <- as.numeric(pbc2$status != "alive")
##D pbc2.id$status2 <- as.numeric(pbc2.id$status != "alive")
##D 
##D # we fit the joint model using splines for the subject-specific 
##D # longitudinal trajectories and a spline-approximated baseline
##D # risk function
##D lmeFit <- lme(log(serBilir) ~ ns(year, 2), data = pbc2,
##D     random = ~ ns(year, 2) | id)
##D survFit <- coxph(Surv(years, status2) ~ drug, data = pbc2.id, x = TRUE)
##D jointFit <- jointModelBayes(lmeFit, survFit, timeVar = "year")
##D 
##D # prediction error at year 10 using longitudinal data up to year 5 
##D prederrJM(jointFit, pbc2, Tstart = 5, Thoriz = 10)
##D prederrJM(jointFit, pbc2, Tstart = 5, Thoriz = 6.5, interval = TRUE)
## End(Not run)



