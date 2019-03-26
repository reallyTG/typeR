library(AF)


### Name: AFclogit
### Title: Attributable fraction estimation based on a conditional logistic
###   regression model as a 'clogit' object (commonly used for matched
###   case-control sampling designs).
### Aliases: AFclogit

### ** Examples

expit <- function(x) 1 / (1 + exp( - x))
NN <- 1000000
n <- 500

# Example 1: matched case-control
# Duplicate observations in order to create a matched data sample
# Create an unobserved confounder U common for each pair of individuals
intercept <- -6
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

# Fit a clogit object
fit <- clogit(formula = Y ~ X + Z + X * Z + strata(id), data = data)

# Estimate the attributable fraction from the fitted conditional logistic regression
AFclogit_est <- AFclogit(fit, data, exposure = "X", clusterid="id")
summary(AFclogit_est)



