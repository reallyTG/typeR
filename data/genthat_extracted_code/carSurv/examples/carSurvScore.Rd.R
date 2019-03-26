library(carSurv)


### Name: carSurvScore
### Title: Estimate Correlation-Adjusted Regression Survival (CARS) Scores
### Aliases: carSurvScore
### Keywords: survival

### ** Examples

##########################################
# Simulate accelerated, failure time model

# Generate multivariate normal distributed covariates
noObs <- 100
noCovar <- 10
library(mvtnorm)
set.seed(190)
X <- rmvnorm(noObs, mean=rep(0, noCovar), sigma=diag(noCovar))

# Generate gamma distributed survival times
# Only the first 5 variables have an influence
eta <- 1 - 2 * X[,1] - X[,2] + X[,3] +
0.5 * X[,4] + 1.5 * X[,5]

# Function to generate survival times
genSurv <- function(x) {
set.seed(x)
rgamma(1, shape=2, scale=exp(eta[x]))
}

# Generate survival times
survT <- sapply(1:length(eta), genSurv)

# Generate exponential distributed censoring times
censT <- rexp(noObs, rate=1)

# Calculate event indicator
eventInd <- ifelse(survT <= censT, 1, 0)

# Calculate observed times
obsTime <- survT
obsTime[survT > censT] <- censT [survT > censT]

# Estimate CAR scores
carScores <- carSurvScore(obsTime=obsTime, obsEvent=eventInd, X=X)
carScores



