library(JMbayes)


### Name: bma.combine
### Title: Combines Predictions for Bayesian Model Averaging
### Aliases: bma.combine
### Keywords: methods

### ** Examples

## Not run: 
##D # we construct the composite event indicator (transplantation or death)
##D pbc2$status2 <- as.numeric(pbc2$status != "alive")
##D pbc2.id$status2 <- as.numeric(pbc2.id$status != "alive")
##D 
##D # we fit two joint models using splines for the subject-specific 
##D # longitudinal trajectories and a spline-approximated baseline
##D # risk function; the first one with the current value parameterization
##D # and the other with the shared random effects parameterization
##D lmeFit <- lme(log(serBilir) ~ ns(year, 2), data = pbc2,
##D               random = ~ ns(year, 2) | id)
##D survFit <- coxph(Surv(years, status2) ~ drug, data = pbc2.id, x = TRUE)
##D 
##D jointFit1 <- jointModelBayes(lmeFit, survFit, timeVar = "year")
##D jointFit2 <- update(jointFit1, param = "shared-RE")
##D 
##D # we compute survival probabilities for Subject 2 with 
##D # different weights
##D ND <- pbc2[pbc2$id == 2, ] # the data of Subject 2
##D survPreds1 <- survfitJM(jointFit1, newdata = ND, weight = 0.4)
##D survPreds2 <- survfitJM(jointFit2, newdata = ND, weight = 0.6)
##D 
##D survPreds.bma <- bma.combine(survPreds1, survPreds2)
##D survPreds.bma
##D plot(survPreds.bma)
## End(Not run)



