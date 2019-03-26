library(misreport)


### Name: bootListExperiment
### Title: List experiment regression with bootstrapped standard errors
### Aliases: bootListExperiment

### ** Examples


## Simulated list experiment and direct question
n <- 10000
J <- 4

# Covariates
x <- cbind(intercept = rep(1, n), continuous1 = rnorm(n),
           continuous2 = rnorm(n), binary1 = rbinom(n, 1, 0.5))

treatment <- rbinom(n, 1, 0.5)

# Simulate Z*
param_sensitive <- c(0.25, -0.25, 0.5, 0.25)
prob_sensitive <- plogis(x %*% param_sensitive)
true_belief <- rbinom(n, 1, prob = prob_sensitive)

# Simulate whether respondent misreports (U*)
param_misreport <- c(-0.25, 0.25, -0.5, 0.5)
prob_misreport <- plogis(x %*% param_misreport) * true_belief
misreport <- rbinom(n, 1, prob = prob_misreport)

# Simulate control items Y*
param_control <- c(0.25, 0.25, -0.25, 0.25, U = -0.5, Z = 0.25)
prob.control <- plogis(cbind(x, misreport, true_belief) %*% param_control)
control_items <- rbinom(n, J, prob.control)

# List experiment and direct question responses
direct <- true_belief
direct[misreport == 1] <- 0
y <- control_items + true_belief * treatment

A <- data.frame(y, direct, treatment,
                continuous1 = x[, "continuous1"],
                continuous2 = x[, "continuous2"],
                binary1 = x[, "binary1"])

## Not run: 
##D # Note: substantial computation time
##D model.sim <- bootListExperiment(y ~ continuous1 + continuous2 + binary1,
##D                                 data = A, treatment = "treatment",
##D                                 direct = "direct",
##D                                 J = 4, control.constraint = "none",
##D                                 sensitive.response = 1,
##D                                 boot.iter = 500, parallel = TRUE, n.cores = 2)
##D summary(model.sim, digits = 3)
## End(Not run)




