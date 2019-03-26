library(gaston)


### Name: logistic.mm.aireml
### Title: Logistic mixed model fitting with Penalized Quasi-Likelihood /
###   AIREML
### Aliases: logistic.mm.aireml
### Keywords: Penalized Quasi-Likelihood Average Information Restricted
###   Maximum Likelihood (AIREML) Genetic effect

### ** Examples

# Load data
data(AGT)
x <- as.bed.matrix(AGT.gen, AGT.fam, AGT.bim)

# Compute Genetic Relationship Matrix
standardize(x) <- "p"
K <- GRM(x)

# Simulate a quantitative genotype under the LMM
set.seed(1)
mu <- 1 + x %*% rnorm(ncol(x), sd = 2)/sqrt(ncol(x))
pi <- 1/(1+exp(-mu))
y <- 1*( runif(length(pi))<pi )

# Estimates
estimates <- logistic.mm.aireml(y, K = K, verbose = FALSE)
str(estimates)



