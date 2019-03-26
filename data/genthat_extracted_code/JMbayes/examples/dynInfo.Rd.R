library(JMbayes)


### Name: dynInfo
### Title: Dynamic Information of an Extra Longitudinal Measurement
### Aliases: dynInfo
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
##D lmeFit <- lme(log(serBilir) ~ ns(year, 3),
##D     random = list(id = pdDiag(form = ~ ns(year, 3))), data = pbc2)
##D survFit <- coxph(Surv(years, status2) ~ drug, data = pbc2.id, x = TRUE)
##D jointFit <- jointModelBayes(lmeFit, survFit, timeVar = "year")
##D 
##D dynInfo(jointFit, newdata = pbc2[pbc2$id == 2, ], Dt = 5)[[1]]
## End(Not run)



