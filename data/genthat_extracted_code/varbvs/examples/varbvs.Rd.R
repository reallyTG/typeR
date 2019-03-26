library(varbvs)


### Name: varbvs
### Title: Fit variable selection model using variational approximation
###   methods.
### Aliases: varbvs

### ** Examples


# LINEAR REGRESSION EXAMPLE
# -------------------------
# Data are 200 uncorrelated ("unlinked") single nucleotide polymorphisms
# (SNPs) with simulated genotypes, in which the first 20 of them have an
# effect on the outcome. Also generate data for 3 covariates.
maf <- 0.05 + 0.45*runif(200)
X   <- (runif(400*200) < maf) + (runif(400*200) < maf)
X   <- matrix(as.double(X),400,200,byrow = TRUE)
Z   <- randn(400,3)

# Generate the ground-truth regression coefficients for the variables
# (X) and additional 3 covariates (Z). Adjust the QTL effects so that
# the variables (SNPs) explain 50 percent of the variance in the
# outcome.
u    <- c(-1,2,1)
beta <- c(rnorm(20),rep(0,180))
beta <- 1/sd(c(X %*% beta)) * beta

# Generate the quantitative trait measurements.
y <- c(-2 + Z %*% u + X %*% beta + rnorm(400))

# Fit the variable selection model.
fit <- varbvs(X,Z,y,logodds = seq(-3,-1,0.1))
print(summary(fit))

# Compute the posterior mean estimate of hyperparameter sa.
sa <- with(fit,sum(sa * w))

# Compare estimated outcomes against observed outcomes.
y.fit <- predict(fit,X,Z)
print(cor(y,y.fit))

# LOGISTIC REGRESSION EXAMPLE
# ---------------------------
# Data are 100 uncorrelated ("unlinked") single nucleotide polymorphisms
# (SNPs) with simulated genotypes, in which the first 10 of them have an
# effect on the outcome. Also generate data for 2 covariates.
maf <- 0.05 + 0.45*runif(100)
X   <- (runif(750*100) < maf) + (runif(750*100) < maf)
X   <- matrix(as.double(X),750,100,byrow = TRUE)
Z   <- randn(750,2)

# Generate the ground-truth regression coefficients for the variables
# (X) and additional 2 covariates (Z).
u    <- c(-1,1)
beta <- c(0.5*rnorm(10),rep(0,90))

# Simulate the binary trait (case-control status) as a coin toss with
# success rates given by the logistic regression.
y <- as.double(runif(750) < sigmoid(-1 + Z %*% u + X %*% beta))

# Fit the variable selection model.
fit <- varbvs(X,Z,y,"binomial",logodds = seq(-2,-0.5,0.5))
print(summary(fit))



