library(list)


### Name: plot.predict.ictreg
### Title: Plot Method for the Item Count Technique
### Aliases: plot.predict.ictreg
### Keywords: models regression

### ** Examples


data(race)
race.south <- race.nonsouth <- race
race.south[, "south"] <- 1
race.nonsouth[, "south"] <- 0

## Not run: 
##D 
##D # Fit EM algorithm ML model with constraint
##D ml.constrained.results <- ictreg(y ~ south + age + male + college, 
##D    data = race, treat = "treat", J=3, method = "ml", 
##D    overdispersed = FALSE, constrained = TRUE)
##D 
##D # Calculate average predictions for respondents in the South 
##D # and the the North of the US for the MLE model, replicating the 
##D # estimates presented in Figure 1, Imai (2011)
##D avg.pred.south.mle <- predict(ml.constrained.results, 
##D    newdata = race.south, avg = TRUE, interval = "confidence")
##D avg.pred.nonsouth.mle <- predict(ml.constrained.results, 
##D    newdata = race.nonsouth, avg = TRUE, interval = "confidence")
##D 
##D # A plot of a single estimate and its confidence interval
##D plot(avg.pred.south.mle, labels = "South")
##D 
##D # A  plot of the two estimates and their confidence intervals
##D # use c() to combine more than one predict object for plotting
##D plot(c(avg.pred.south.mle, avg.pred.nonsouth.mle), labels = c("South", "Non-South"))
##D 
##D # The difference option can also be used to simultaneously
##D # calculate separate estimates of the two sub-groups
##D # and the estimated difference. This can also be plotted.
##D 
##D avg.pred.diff.mle <- predict(ml.constrained.results, 
##D    newdata = race.south, newdata.diff = race.nonsouth,
##D    se.fit = TRUE, avg = TRUE, interval="confidence")
##D 
##D plot(avg.pred.diff.mle, labels = c("South", "Non-South", "Difference"))
##D 
##D # Social desirability bias plots
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
##D plot(avg.pred.social.desirability)
##D 
## End(Not run)



