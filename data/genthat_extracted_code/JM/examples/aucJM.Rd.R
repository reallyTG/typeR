library(JM)


### Name: aucJM
### Title: Time-Dependent AUCs for Joint Models
### Aliases: aucJM aucJM.jointModel
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
##D jointFit <- jointModel(lmeFit, survFit, timeVar = "year", 
##D     method = "piecewise-PH-aGH")
##D 
##D # AUC using data up to year 5 with horizon at year 8
##D aucJM(jointFit, pbc2, Tstart = 5, Thoriz = 8)
## End(Not run)



