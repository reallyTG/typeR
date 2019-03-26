library(list)


### Name: predict.ictregBayesHier
### Title: Predict Method for the Item Count Technique with Bayesian
###   Hierarchical Regression
### Aliases: predict.ictregBayesHier
### Keywords: models regression

### ** Examples


data(race)

## Not run: 
##D 
##D mle.estimates.multi <- ictreg(y ~ male + college, data = multi,
##D   constrained = TRUE)
##D 
##D draws <- mvrnorm(n = 3, mu = coef(mle.estimates.multi), 
##D   Sigma = vcov(mle.estimates.multi) * 9)
##D 
##D bayes.fit <- ictregBayesHier(y ~ male + college,
##D                         formula.level.2 = ~ 1, 
##D                         delta.start.level.1 = list(draws[1, 8:9], draws[1, 2:3], draws[1, 5:6]),
##D                         data = multi, treat = "treat",
##D                         delta.tune = list(rep(0.005, 2), rep(0.05, 2), rep(0.05, 2)),
##D                         alpha.tune = rep(0.001, length(unique(multi$state))),
##D                         J = 3, group.level.2 = "state",
##D                         n.draws = 100, burnin = 10, thin = 1)
##D 
##D bayes.predict <- predict(bayes.fit, interval = "confidence", se.fit = TRUE)
##D 
## End(Not run)





