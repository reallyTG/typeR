library(ReIns)


### Name: cProbGPD
### Title: Estimator of small exceedance probabilities and large return
###   periods using censored GPD-MLE
### Aliases: cProbGPD cReturnGPD

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

# GPD-MLE estimator adapted for right censoring
cpot <- cGPDmle(Z, censored=censored, plot=TRUE)

# Exceedance probability
q <- 10
cProbGPD(Z, gamma1=cpot$gamma1, sigma1=cpot$sigma1,
         censored=censored, q=q, plot=TRUE)
         
# Return period
cReturnGPD(Z, gamma1=cpot$gamma1, sigma1=cpot$sigma1,
         censored=censored, q=q, plot=TRUE)         



