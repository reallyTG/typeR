library(JMbayes)


### Name: plot.survfitJM
### Title: Plot Method for survfit.JMbayes and survfit.mvJMbayes Objects
### Aliases: plot.survfit.JMbayes plot.survfit.mvJMbayes
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
##D 
##D # the default call to the plot method using the first three
##D # longitudinal measurements
##D plot(survPreds[[3]])
##D 
##D # we produce the corresponding plot
##D par(mfrow = c(2, 2), oma = c(0, 2, 0, 2))
##D for (i in c(1,3,5,7)) {
##D     plot(survPreds[[i]], estimator = "median", conf.int = TRUE,
##D         include.y = TRUE, main = paste("Follow-up time:",
##D             round(survPreds[[i]]$last.time, 1)), ylab = "", ylab2 = "")
##D }
##D mtext("log serum bilirubin", side = 2, line = -1, outer = TRUE)
##D mtext("Survival Probability", side = 4, line = -1, outer = TRUE)
## End(Not run)



