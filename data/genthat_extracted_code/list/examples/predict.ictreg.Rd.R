library(list)


### Name: predict.ictreg
### Title: Predict Method for Item Count Technique
### Aliases: predict.ictreg
### Keywords: models regression

### ** Examples


data(race)

race.south <- race.nonsouth <- race

race.south[, "south"] <- 1
race.nonsouth[, "south"] <- 0

## Not run: 
##D 
##D # Fit EM algorithm ML model with constraint with no covariates
##D 
##D ml.results.south.nocov <- ictreg(y ~ 1, 
##D    data = race[race$south == 1, ], method = "ml", treat = "treat", 
##D    J = 3, overdispersed = FALSE, constrained = TRUE)
##D ml.results.nonsouth.nocov <- ictreg(y ~ 1, 
##D    data = race[race$south == 0, ], method = "ml", treat = "treat", 
##D    J = 3, overdispersed = FALSE, constrained = TRUE)
##D 
##D # Calculate average predictions for respondents in the South 
##D # and the the North of the US for the MLE no covariates 
##D # model, replicating the estimates presented in Figure 1, 
##D # Imai (2010)
##D 
##D avg.pred.south.nocov <- predict(ml.results.south.nocov,
##D    newdata = as.data.frame(matrix(1, 1, 1)), se.fit = TRUE, 
##D    avg = TRUE)
##D avg.pred.nonsouth.nocov <- predict(ml.results.nonsouth.nocov,
##D    newdata = as.data.frame(matrix(1, 1, 1)), se.fit = TRUE, 
##D    avg = TRUE)
##D 
##D # Fit linear regression
##D 
##D lm.results <- ictreg(y ~ south + age + male + college, 
##D    data = race, treat = "treat", J=3, method = "lm")
##D 
##D # Calculate average predictions for respondents in the 
##D # South and the the North of the US for the lm model, 
##D # replicating the estimates presented in Figure 1, Imai (2010)
##D 
##D avg.pred.south.lm <- predict(lm.results, newdata = race.south, 
##D    se.fit = TRUE, avg = TRUE)
##D 
##D avg.pred.nonsouth.lm <- predict(lm.results, newdata = race.nonsouth, 
##D    se.fit = TRUE, avg = TRUE)
##D 
##D # Fit two-step non-linear least squares regression
##D 
##D nls.results <- ictreg(y ~ south + age + male + college, 
##D    data = race, treat = "treat", J=3, method = "nls")
##D 
##D # Calculate average predictions for respondents in the South 
##D # and the the North of the US for the NLS model, replicating
##D # the estimates presented in Figure 1, Imai (2010)
##D 
##D avg.pred.nls <- predict(nls.results, newdata = race.south, 
##D    newdata.diff = race.nonsouth, se.fit = TRUE, avg = TRUE)
##D 
##D # Fit EM algorithm ML model with constraint
##D 
##D ml.constrained.results <- ictreg(y ~ south + age + male + college, 
##D    data = race, treat = "treat", J=3, method = "ml", 
##D    overdispersed = FALSE, constrained = TRUE)
##D 
##D # Calculate average predictions for respondents in the South 
##D # and the the North of the US for the MLE model, replicating the 
##D # estimates presented in Figure 1, Imai (2010)
##D 
##D avg.pred.diff.mle <- predict(ml.constrained.results, 
##D    newdata = race.south, newdata.diff = race.nonsouth,
##D    se.fit = TRUE, avg = TRUE)
##D 
##D # Calculate average predictions from the item count technique
##D # regression and from a direct sensitive item modeled with
##D # a logit.
##D 
##D # Estimate logit for direct sensitive question
##D 
##D data(mis)
##D 
##D mis.list <- subset(mis, list.data == 1)
##D 
##D mis.sens <- subset(mis, sens.data == 1)
##D 
##D # Fit EM algorithm ML model
##D 
##D fit.list <- ictreg(y ~ age + college + male + south,
##D    J = 4, data = mis.list, method = "ml")
##D 
##D # Fit logistic regression with directly-asked sensitive question
##D 
##D fit.sens <- glm(sensitive ~ age + college + male + south, 
##D    data = mis.sens, family = binomial("logit"))
##D 
##D # Predict difference between response to sensitive item
##D # under the direct and indirect questions (the list experiment).
##D # This is an estimate of the revealed social desirability bias
##D # of respondents. See Blair and Imai (2010).
##D 
##D avg.pred.social.desirability <- predict(fit.list, 
##D    direct.glm = fit.sens, se.fit = TRUE)
##D 
## End(Not run)





