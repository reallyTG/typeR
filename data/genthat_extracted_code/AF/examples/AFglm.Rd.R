library(AF)


### Name: AFglm
### Title: Attributable fraction estimation based on a logistic regression
###   model from a 'glm' object (commonly used for cross-sectional or
###   case-control sampling designs).
### Aliases: AFglm

### ** Examples

# Simulate a cross-sectional sample

expit <- function(x) 1 / (1 + exp( - x))
n <- 1000
Z <- rnorm(n = n)
X <- rbinom(n = n, size = 1, prob = expit(Z))
Y <- rbinom(n = n, size = 1, prob = expit(Z + X))

# Example 1: non clustered data from a cross-sectional sampling design
data <- data.frame(Y, X, Z)

# Fit a glm object
fit <- glm(formula = Y ~ X + Z + X * Z, family = binomial, data = data)

# Estimate the attributable fraction from the fitted logistic regression
AFglm_est <- AFglm(object = fit, data = data, exposure = "X")
summary(AFglm_est)

# Example 2: clustered data from a cross-sectional sampling design
# Duplicate observations in order to create clustered data
id <- rep(1:n, 2)
data <- data.frame(id = id, Y = c(Y, Y), X = c(X, X), Z = c(Z, Z))

# Fit a glm object
fit <- glm(formula = Y ~ X + Z + X * Z, family = binomial, data = data)

# Estimate the attributable fraction from the fitted logistic regression
AFglm_clust <- AFglm(object = fit, data = data,
                         exposure = "X", clusterid = "id")
summary(AFglm_clust)


# Example 3: non matched case-control
# Simulate a sample from a non matched case-control sampling design
# Make the outcome a rare event by setting the intercept to -6

expit <- function(x) 1 / (1 + exp( - x))
NN <- 1000000
n <- 500
intercept <- -6
Z <- rnorm(n = NN)
X <- rbinom(n = NN, size = 1, prob = expit(Z))
Y <- rbinom(n = NN, size = 1, prob = expit(intercept + X + Z))
population <- data.frame(Z, X, Y)
Case <- which(population$Y == 1)
Control <- which(population$Y == 0)
# Sample cases and controls from the population
case <- sample(Case, n)
control <- sample(Control, n)
data <- population[c(case, control), ]

# Fit a glm object
fit <- glm(formula = Y ~ X + Z + X * Z, family = binomial, data = data)

# Estimate the attributable fraction from the fitted logistic regression
AFglm_est_cc <- AFglm(object = fit, data = data, exposure = "X", case.control = TRUE)
summary(AFglm_est_cc)



