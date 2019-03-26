library(ReIns)


### Name: cProbGH
### Title: Estimator of small exceedance probabilities and large return
###   periods using censored generalised Hill
### Aliases: cProbGH cReturnGH

### ** Examples

# Set seed
set.seed(29072016)

# Pareto random sample
X <- rpareto(500, shape=2)

# Censoring variable
Y <- rpareto(500, shape=1)

# Observed sample
Z <- pmin(X, Y)

# Censoring indicator
censored <- (X>Y)

# Generalised Hill estimator adapted for right censoring
cghill <- cgenHill(Z, censored=censored, plot=TRUE)

# Small exceedance probability
q <- 10
cProbGH(Z, censored=censored, gamma1=cghill$gamma1, q=q, plot=TRUE)

# Return period
cReturnGH(Z, censored=censored, gamma1=cghill$gamma1, q=q, plot=TRUE)



