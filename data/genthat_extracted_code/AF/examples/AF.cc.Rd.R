library(AF)


### Name: AF.cc
### Title: Attributable fraction for mached and non-matched case-control
###   sampling designs. NOTE! Deprecated function. Use 'AFglm' (for
###   unmatched case-control studies) or 'AFclogit' (for matched
###   case-control studies).
### Aliases: AF.cc

### ** Examples

expit <- function(x) 1 / (1 + exp( - x))
NN <- 1000000
n <- 500

# Example 1: non matched case-control
# Simulate a sample from a non matched case-control sampling design
# Make the outcome a rare event by setting the intercept to -6
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

# Estimation of the attributable fraction
AF.cc_est <- AF.cc(formula = Y ~ X + Z + X * Z, data = data, exposure = "X")
summary(AF.cc_est)

# Example 2: matched case-control
# Duplicate observations in order to create a matched data sample
# Create an unobserved confounder U common for each pair of individuals
U  <- rnorm(n = NN)
Z1 <- rnorm(n = NN)
Z2 <- rnorm(n = NN)
X1 <- rbinom(n = NN, size = 1, prob = expit(U + Z1))
X2 <- rbinom(n = NN, size = 1, prob = expit(U + Z2))
Y1 <- rbinom(n = NN, size = 1, prob = expit(intercept + U + Z1 + X1))
Y2 <- rbinom(n = NN, size = 1, prob = expit(intercept + U + Z2 + X2))
# Select discordant pairs
discordant <- which(Y1!=Y2)
id <- rep(1:n, 2)
# Sample from discordant pairs
incl <- sample(x = discordant, size = n, replace = TRUE)
data <- data.frame(id = id, Y = c(Y1[incl], Y2[incl]), X = c(X1[incl], X2[incl]),
                   Z = c(Z1[incl], Z2[incl]))

# Estimation of the attributable fraction
AF.cc_match <- AF.cc(formula = Y ~ X + Z + X * Z, data = data,
                         exposure = "X", clusterid = "id", matched = TRUE)
summary(AF.cc_match)



