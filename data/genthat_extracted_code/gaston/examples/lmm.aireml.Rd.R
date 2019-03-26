library(gaston)


### Name: lmm.aireml
### Title: Linear mixed model fitting with AIREML
### Aliases: lmm.aireml
### Keywords: Average Information Restricted Maximum Likelihood (AIREML)
###   Genetic effect

### ** Examples

# Load data
data(AGT)
x <- as.bed.matrix(AGT.gen, AGT.fam, AGT.bim)

# Compute Genetic Relationship Matrix
standardize(x) <- "p"
K <- GRM(x)

# Simulate a quantitative genotype under the LMM
set.seed(1)
y <- 1 + x %*% rnorm(ncol(x), sd = 1)/sqrt(ncol(x)) + rnorm(nrow(x), sd = sqrt(2))

# Estimates
estimates <- lmm.aireml(y, K = K, verbose = FALSE)
str(estimates)



