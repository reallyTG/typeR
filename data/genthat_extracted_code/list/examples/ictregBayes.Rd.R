library(list)


### Name: ictregBayes
### Title: Item Count Technique
### Aliases: ictregBayes
### Keywords: models regression

### ** Examples



data(race)

## Not run: 
##D 
##D ## Multiple chain MCMC list experiment regression
##D ## starts with overdispersed MLE starting values
##D 
##D ## Standard single sensitive-item design
##D 
##D ## Control item parameters fully constrained
##D 
##D mle.estimates <- ictreg(y ~ male + college + age + south, data = race)
##D 
##D draws <- mvrnorm(n = 3, mu = coef(mle.estimates), 
##D   Sigma = vcov(mle.estimates) * 9)
##D 
##D bayesDraws.1 <- ictregBayes(y ~ male + college + age + south, data = race, 
##D   delta.start = draws[1, 1:5], psi.start = draws[1, 6:10], burnin = 10000, 
##D   n.draws = 100000, delta.tune = diag(.002, 5), psi.tune = diag(.00025, 5),
##D   constrained.single = "full")
##D 
##D bayesDraws.2 <- ictregBayes(y ~ male + college + age + south, data = race, 
##D   delta.start = draws[2, 1:5], psi.start = draws[2, 6:10], burnin = 10000, 
##D   n.draws = 100000, delta.tune = diag(.002, 5), psi.tune = diag(.00025, 5),
##D   constrained.single = "full")
##D 
##D bayesDraws.3 <- ictregBayes(y ~ male + college + age + south, data = race, 
##D   delta.start = draws[3, 1:5], psi.start = draws[3, 6:10], burnin = 10000, 
##D   n.draws = 100000, delta.tune = diag(.002, 5), psi.tune = diag(.00025, 5),
##D   constrained.single = "full")
##D 
##D bayesSingleConstrained <- as.list(bayesDraws.1, bayesDraws.2, bayesDraws.3)
##D 
##D summary(bayesSingleConstrained)
##D 
##D ## Control item parameters unconstrained
##D 
##D mle.estimates <- ictreg(y ~ male + college + age + south, data = race,
##D   constrained = FALSE)
##D 
##D draws <- mvrnorm(n = 3, mu = coef(mle.estimates), 
##D   Sigma = vcov(mle.estimates) * 9)
##D 
##D bayesDraws.1 <- ictregBayes(y ~ male + college + age + south, data = race, 
##D   delta.start = draws[1, 1:5], psi.start = list(psi0 = draws[1, 6:10], 
##D   psi1 = draws[1, 11:15]), burnin = 10000, n.draws = 100000, 
##D   delta.tune = diag(.002, 5), 
##D   psi.tune = list(psi0 = diag(.0017, 5), psi1 = diag(.00005, 5)),
##D   constrained.single = "none")
##D 
##D bayesDraws.2 <- ictregBayes(y ~ male + college + age + south, data = race, 
##D   delta.start = draws[2, 1:5], psi.start = list(psi0 = draws[2, 6:10], 
##D   psi1 = draws[2, 11:15]), burnin = 10000, n.draws = 100000, 
##D   delta.tune = diag(.002, 5), 
##D   psi.tune = list(psi0 = diag(.0017, 5), psi1 = diag(.00005, 5)),
##D   constrained.single = "none")
##D 
##D bayesDraws.3 <- ictregBayes(y ~ male + college + age + south, data = race, 
##D   delta.start = draws[3, 1:5], psi.start = list(psi0 = draws[3, 6:10], 
##D   psi1 = draws[3, 11:15]), burnin = 10000, n.draws = 100000, 
##D   delta.tune = diag(.002, 5), 
##D   psi.tune = list(psi0 = diag(.0017, 5), psi1 = diag(.00005, 5)),
##D   constrained.single = "none")
##D 
##D bayesSingleUnconstrained <- as.list(bayesDraws.1, bayesDraws.2, bayesDraws.3)
##D 
##D summary(bayesSingleUnconstrained)
##D 
##D ## Control item parameters constrained except intercept
##D 
##D mle.estimates <- ictreg(y ~ male + college + age + south, data = race,
##D   constrained = TRUE)
##D 
##D draws <- mvrnorm(n = 3, mu = coef(mle.estimates), 
##D   Sigma = vcov(mle.estimates) * 9)
##D 
##D bayesDraws.1 <-  ictregBayes(y ~ male + college + age + south, data = race, 
##D   delta.start = draws[1, 1:5], psi.start = c(draws[1, 6:10],0),
##D   burnin = 10000, n.draws = 100000, delta.tune = diag(.002, 5),
##D   psi.tune = diag(.0004, 6), constrained.single = "intercept")
##D 
##D bayesDraws.2 <-  ictregBayes(y ~ male + college + age + south, data = race, 
##D   delta.start = draws[2, 1:5], psi.start = c(draws[2, 6:10],0),
##D   burnin = 10000, n.draws = 100000, delta.tune = diag(.002, 5),
##D   psi.tune = diag(.0004, 6), constrained.single = "intercept")
##D 
##D bayesDraws.3 <-  ictregBayes(y ~ male + college + age + south, data = race, 
##D   delta.start = draws[3, 1:5], psi.start = c(draws[3, 6:10],0),
##D   burnin = 10000, n.draws = 100000, delta.tune = diag(.002, 5),
##D   psi.tune = diag(.0004, 6), constrained.single = "intercept")
##D 
##D bayesSingleInterceptOnly <- as.list(bayesDraws.1, bayesDraws.2, bayesDraws.3)
##D 
##D summary(bayesSingleInterceptOnly)
##D 
##D ## Multiple sensitive item design
##D 
##D ## Constrained (estimated control item count not included in sensitive fit)
##D 
##D mle.estimates.multi <- ictreg(y ~ male + college + age + south, data = multi,
##D   constrained = TRUE)
##D 
##D draws <- mvrnorm(n = 3, mu = coef(mle.estimates.multi), 
##D   Sigma = vcov(mle.estimates.multi) * 9)
##D 
##D bayesMultiDraws.1 <- ictregBayes(y ~ male + college + age + south, 
##D   data = multi, delta.start = list(draws[1, 6:10], draws[1, 11:15]), 
##D   psi.start = draws[1, 1:5], burnin = 10000, n.draws = 100000, 
##D   delta.tune = diag(.002, 5), psi.tune = diag(.001, 5), 
##D   constrained.multi = TRUE)
##D 
##D bayesMultiDraws.2 <- ictregBayes(y ~ male + college + age + south, 
##D   data = multi, delta.start = list(draws[2, 6:10], draws[2, 11:15]), 
##D   psi.start = draws[2, 1:5], burnin = 10000, n.draws = 100000, 
##D   delta.tune = diag(.002, 5), psi.tune = diag(.001, 5), 
##D   constrained.multi = TRUE)
##D 
##D bayesMultiDraws.3 <- ictregBayes(y ~ male + college + age + south, 
##D   data = multi, delta.start = list(draws[3, 6:10], draws[3, 11:15]), 
##D   psi.start = draws[3, 1:5], burnin = 10000, n.draws = 100000, 
##D   delta.tune = diag(.002, 5), psi.tune = diag(.001, 5), 
##D   constrained.multi = TRUE)
##D 
##D bayesMultiConstrained <- as.list(bayesMultiDraws.1, bayesMultiDraws.2, 
##D   bayesMultiDraws.3)
##D 
##D summary(bayesMultiConstrained)
##D 
##D ## Unconstrained (estimated control item count is included in sensitive fit)
##D 
##D mle.estimates.multi <- ictreg(y ~ male + college + age + south, data = multi,
##D   constrained = FALSE)
##D 
##D draws <- mvrnorm(n = 3, mu = coef(mle.estimates.multi), 
##D   Sigma = vcov(mle.estimates.multi) * 9)
##D 
##D bayesMultiDraws.1 <- ictregBayes(y ~ male + college + age + south, 
##D   data = multi, delta.start = list(draws[1, 6:10], draws[1, 11:15]), 
##D   psi.start = draws[1, 1:5], burnin = 50000, n.draws = 300000, 
##D   delta.tune = diag(.0085, 6), psi.tune = diag(.00025, 5), 
##D   constrained.multi = FALSE)
##D 
##D bayesMultiDraws.2 <- ictregBayes(y ~ male + college + age + south, 
##D   data = multi, delta.start = list(draws[2, 6:10], draws[2, 11:15]), 
##D   psi.start = draws[2, 1:5], burnin = 50000, n.draws = 300000, 
##D   delta.tune = diag(.0085, 6), psi.tune = diag(.00025, 5), 
##D   constrained.multi = FALSE)
##D 
##D bayesMultiDraws.3 <- ictregBayes(y ~ male + college + age + south, 
##D   data = multi, delta.start = list(draws[3, 6:10], draws[3, 11:15]), 
##D   psi.start = draws[3, 1:5], burnin = 50000, n.draws = 300000, 
##D   delta.tune = diag(.0085, 6), psi.tune = diag(.00025, 5), 
##D   constrained.multi = FALSE)
##D 
##D bayesMultiUnconstrained <- as.list(bayesMultiDraws.1, bayesMultiDraws.2, 
##D   bayesMultiDraws.3)
##D 
##D summary(bayesMultiUnconstrained)
##D 
##D ## Mixed effects models
##D 
##D ## Varying intercepts
##D 
##D mle.estimates <- ictreg(y ~ male + college + age + south, data = race)
##D 
##D draws <- mvrnorm(n = 3, mu = coef(mle.estimates), 
##D   Sigma = vcov(mle.estimates) * 9)
##D 
##D bayesDraws.1 <- ictregBayes(y ~ male + college + age + south, data = race, 
##D   delta.start = draws[1, 1:5], psi.start = draws[1, 6:10], burnin = 100, 
##D   n.draws = 1000, delta.tune = diag(.002, 5), psi.tune = diag(.00025, 5),
##D   constrained.single = "full", group.mixed = "state", formula.mixed = ~ 1)
##D 
##D bayesDraws.2 <- ictregBayes(y ~ male + college + age + south, data = race, 
##D   delta.start = draws[2, 1:5], psi.start = draws[2, 6:10], burnin = 10000, 
##D   n.draws = 100000, delta.tune = diag(.002, 5), psi.tune = diag(.00025, 5),
##D   constrained.single = "full", group.mixed = "state", formula.mixed = ~ 1)
##D 
##D bayesDraws.3 <- ictregBayes(y ~ male + college + age + south, data = race, 
##D   delta.start = draws[3, 1:5], psi.start = draws[3, 6:10], burnin = 10000, 
##D   n.draws = 100000, delta.tune = diag(.002, 5), psi.tune = diag(.00025, 5),
##D   constrained.single = "full", group.mixed = "state", formula.mixed = ~ 1)
##D 
##D bayesMixed <- as.list(bayesDraws.1, bayesDraws.2, bayesDraws.3)
##D 
##D summary(bayesMixed)
##D 
## End(Not run)




