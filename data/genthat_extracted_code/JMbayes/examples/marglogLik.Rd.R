library(JMbayes)


### Name: marglogLik
### Title: Calculates Marginal Subject-specific Log-Likelihood
###   Contributions
### Aliases: marglogLik
### Keywords: methods

### ** Examples

## Not run: 
##D # we construct the composite event indicator (transplantation or death)
##D pbc2$status2 <- as.numeric(pbc2$status != "alive")
##D pbc2.id$status2 <- as.numeric(pbc2.id$status != "alive")
##D 
##D # we fit a joint model using splines for the subject-specific 
##D # longitudinal trajectories and a spline-approximated baseline
##D # risk function
##D lmeFit <- lme(log(serBilir) ~ ns(year, 2), data = pbc2,
##D     random = ~ ns(year, 2) | id)
##D survFit <- coxph(Surv(years, status2) ~ drug, data = pbc2.id, x = TRUE)
##D 
##D jointFit <- jointModelBayes(lmeFit, survFit, timeVar = "year")
##D 
##D # we compute marginal log-likelihood contribution for Subject 2
##D ND <- pbc2[pbc2$id == 2, ] # the data of Subject 2
##D marglogLik(jointFit, newdata = ND)
## End(Not run)



