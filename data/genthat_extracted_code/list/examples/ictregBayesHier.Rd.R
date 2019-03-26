library(list)


### Name: ictregBayesHier
### Title: Item Count Technique
### Aliases: ictregBayesHier
### Keywords: models regression

### ** Examples



data(race)

## Not run: 
##D 
##D ## Multiple chain MCMC list experiment regression
##D ## starts with overdispersed MLE starting values
##D 
##D ## Multiple item two level hierarchical model - varying intercepts
##D 
##D mle.estimates.multi <- ictreg(y ~ male + college, data = multi,
##D   constrained = TRUE)
##D 
##D draws <- mvrnorm(n = 3, mu = coef(mle.estimates.multi), 
##D   Sigma = vcov(mle.estimates.multi) * 9)
##D 
##D bayesDraws.1 <- ictregBayesHier(y ~ male + college,
##D                         formula.level.2 = ~ 1, 
##D                         delta.start.level.1 = list(draws[1, 8:9], draws[1, 2:3], draws[1, 5:6]),
##D                         data = multi, treat = "treat",
##D                         delta.tune = list(rep(0.005, 2), rep(0.05, 2), rep(0.05, 2)),
##D                         alpha.tune = rep(0.001, length(unique(multi$state))),
##D                         J = 3, group.level.2 = "state",
##D                         n.draws = 100000, burnin = 50000, thin = 100)
##D 
##D bayesDraws.2 <- ictregBayesHier(y ~ male + college,
##D                         formula.level.2 = ~ 1, 
##D                         delta.start.level.1 = list(draws[2, 8:9], draws[2, 2:3], draws[2, 5:6]),
##D                         data = multi, treat = "treat",
##D                         delta.tune = list(rep(0.005, 2), rep(0.05, 2), rep(0.05, 2)),
##D                         alpha.tune = rep(0.001, length(unique(multi$state))),
##D                         J = 3, group.level.2 = "state",
##D                         n.draws = 100000, burnin = 50000, thin = 100)
##D 
##D bayesDraws.3 <- ictregBayesHier(y ~ male + college,
##D                         formula.level.2 = ~ 1, 
##D                         delta.start.level.1 = list(draws[3, 8:9], draws[3, 2:3], draws[3, 5:6]),
##D                         data = multi, treat = "treat",
##D                         delta.tune = list(rep(0.005, 2), rep(0.05, 2), rep(0.05, 2)),
##D                         alpha.tune = rep(0.001, length(unique(multi$state))),
##D                         J = 3, group.level.2 = "state",
##D                         n.draws = 100000, burnin = 50000, thin = 100)
##D 
##D bayesHierTwoLevel <- as.list(bayesDraws.1, bayesDraws.2, bayesDraws.3)
##D 
##D summary(bayesHierTwoLevel)
##D 
##D ## Multiple item two level hierarchical model - including covariates
##D 
##D mle.estimates.multi <- ictreg(y ~ male + college, data = multi,
##D   constrained = TRUE)
##D 
##D draws <- mvrnorm(n = 3, mu = coef(mle.estimates.multi), 
##D   Sigma = vcov(mle.estimates.multi) * 9)
##D 
##D bayesDraws.1 <- ictregBayesHier(y ~ male + college,
##D                         formula.level.2 = ~ age, 
##D                         delta.start.level.1 = list(draws[1, 8:9], draws[1, 2:3], draws[1, 5:6]),
##D                         data = multi, treat = "treat",
##D                         delta.tune = list(rep(0.005, 2), rep(0.05, 2), rep(0.05, 2)),
##D                         alpha.tune = rep(0.001, length(unique(multi$state))),
##D                         J = 3, group.level.2 = "state",
##D                         n.draws = 100000, burnin = 50000, thin = 100)
##D 
##D bayesDraws.2 <- ictregBayesHier(y ~ male + college,
##D                         formula.level.2 = ~ age, 
##D                         delta.start.level.1 = list(draws[2, 8:9], draws[2, 2:3], draws[2, 5:6]),
##D                         data = multi, treat = "treat",
##D                         delta.tune = list(rep(0.005, 2), rep(0.05, 2), rep(0.05, 2)),
##D                         alpha.tune = rep(0.001, length(unique(multi$state))),
##D                         J = 3, group.level.2 = "state",
##D                         n.draws = 100000, burnin = 50000, thin = 100)
##D 
##D bayesDraws.3 <- ictregBayesHier(y ~ male + college,
##D                         formula.level.2 = ~ age, 
##D                         delta.start.level.1 = list(draws[3, 8:9], draws[3, 2:3], draws[3, 5:6]),
##D                         data = multi, treat = "treat",
##D                         delta.tune = list(rep(0.005, 2), rep(0.05, 2), rep(0.05, 2)),
##D                         alpha.tune = rep(0.001, length(unique(multi$state))),
##D                         J = 3, group.level.2 = "state",
##D                         n.draws = 100000, burnin = 50000, thin = 100)
##D 
##D bayesHierTwoLevel <- as.list(bayesDraws.1, bayesDraws.2, bayesDraws.3)
##D 
##D summary(bayesHierTwoLevel)
##D 
## End(Not run)




