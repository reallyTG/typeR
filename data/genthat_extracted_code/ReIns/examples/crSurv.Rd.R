library(ReIns)


### Name: crSurv
### Title: Non-parametric estimator of conditional survival function
### Aliases: crSurv

### ** Examples

# Set seed
set.seed(29072016)

# Pareto random sample
Y <- rpareto(200, shape=2)

# Censoring variable
C <- rpareto(200, shape=1)

# Observed (censored) sample of variable Y
Ytilde <- pmin(Y, C)

# Censoring indicator
censored <- (Y>C)

# Conditioning variable
X <- seq(1, 10, length.out=length(Y))

# Observed (censored) sample of conditioning variable
Xtilde <- X
Xtilde[censored] <- X[censored] - runif(sum(censored), 0, 1)

# Plot estimates of the conditional survival function
x <- 5
y <- seq(0, 5, 1/100)
plot(y, crSurv(x, y, Xtilde=Xtilde, Ytilde=Ytilde, censored=censored, h=5), type="l", 
     xlab="y", ylab="Conditional survival function")



