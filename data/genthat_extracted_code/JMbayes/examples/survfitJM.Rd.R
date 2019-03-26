library(JMbayes)


### Name: survfitJM
### Title: Prediction in Joint Models
### Aliases: survfitJM survfitJM.JMbayes survfitJM.mvJMbayes
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
##D # we will compute survival probabilities for Subject 2 in a dynamic manner, 
##D # i.e., after each longitudinal measurement is recorded
##D ND <- pbc2[pbc2$id == 2, ] # the data of Subject 2
##D survPreds <- vector("list", nrow(ND))
##D for (i in 1:nrow(ND)) {
##D     survPreds[[i]] <- survfitJM(jointFit, newdata = ND[1:i, ])
##D }
##D survPreds
##D 
##D ###########################################################################
##D 
##D # Predictions from multivariate models
##D 
##D pbc2 <- pbc2[!is.na(pbc2$serChol), ]
##D pbc2.id <- pbc2[!duplicated(pbc2$id), ]
##D pbc2.id$Time <- pbc2.id$years
##D pbc2.id$event <- as.numeric(pbc2.id$status != "alive")
##D 
##D # Fit a trivariate joint model
##D MixedModelFit <- mvglmer(list(log(serBilir) ~ year + (year | id),
##D                               sqrt(serChol) ~ year + (year | id),
##D                               hepatomegaly ~ year + (year | id)), data = pbc2,
##D                          families = list(gaussian, gaussian, binomial), engine = "STAN")
##D 
##D CoxFit <- coxph(Surv(Time, event) ~ drug + age, data = pbc2.id, model = TRUE)
##D 
##D JMFit <- mvJointModelBayes(MixedModelFit, CoxFit, timeVar = "year")
##D 
##D # We want survival probabilities for three subjects
##D ND <- pbc2[pbc2$id %in% c(2, 25, 81), ]
##D 
##D sprobs <- survfitJM(JMFit, ND)
##D sprobs
##D 
##D # Basic plot
##D plot(sprobs)
##D 
##D # split in a 2 rows 2 columns and include the survival function in 
##D # a separate panel; plot only the third & first subjects; change various defaults
##D plot(sprobs, split = c(3, 2), surv_in_all = FALSE, which_subjects = c(3, 1),
##D      lty_lines_CI = 3, col_lines = "blue", col_fill_CI = "red", 
##D      col_points = "pink", pch_points = 12)
##D 
##D ###########################################################################
##D 
##D # run Shiny app
##D runDynPred()
## End(Not run)



