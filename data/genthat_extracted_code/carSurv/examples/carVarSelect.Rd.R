library(carSurv)


### Name: carVarSelect
### Title: Variable selection with Correlation-Adjusted Regression Survival
###   (CARS) Scores
### Aliases: carVarSelect
### Keywords: survival

### ** Examples

##########################################
# Simulate accelerated, failure time model

# Generate multivariate normal distributed covariates
noObs <- 100
noCovar <- 250
library(mvtnorm)
set.seed(7903)
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

# Conduct variable selection using fndr
carScores <- carSurvScore(obsTime=obsTime, obsEvent=eventInd, X=X)
selectedVar <- carVarSelect(carSurvScores=carScores)
selectedVar

# Check true positive and true negative rate
TPR <- mean(c(1:5) %in% selectedVar)
TNR <- mean(c(6:250) %in% setdiff(6:250, selectedVar))
perf <- TPR + TNR -1
perf



