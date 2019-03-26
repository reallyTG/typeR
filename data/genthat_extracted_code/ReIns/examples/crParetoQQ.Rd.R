library(ReIns)


### Name: crParetoQQ
### Title: Conditional Pareto quantile plot for right censored data
### Aliases: crParetoQQ

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


# Conditional Pareto QQ-plot
crParetoQQ(x=1, Xtilde=Xtilde, Ytilde=Ytilde, censored=censored, h=2)

# Plot Hill-type estimates
crHill(x=1, Xtilde, Ytilde, censored, h=2, plot=TRUE)



