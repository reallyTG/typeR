library(Surrogate)


### Name: plot TrialLevelMA
### Title: Provides a plots of trial-level surrogacy in the meta-analytic
###   framework based on the output of the 'TrialLevelMA()' function
### Aliases: plot.TrialLevelMA
### Keywords: Plot surrogacy Meta-analytic framework Trial-level surrogacy
###   Multiple-trial setting

### ** Examples

# Generate vector treatment effects on S
set.seed(seed = 1)
Alpha.Vector <- seq(from = 5, to = 10, by=.1) + runif(min = -.5, max = .5, n = 51)
# Generate vector treatment effects on T
set.seed(seed=2)
Beta.Vector <- (Alpha.Vector * 3) + runif(min = -5, max = 5, n = 51)
# Vector of sample sizes of the trials (here, all n_i=10)
N.Vector <- rep(10, times=51)

# Apply the function to estimate R^2_{trial}
Fit <- TrialLevelMA(Alpha.Vector=Alpha.Vector,
Beta.Vector=Beta.Vector, N.Vector=N.Vector)

# Plot the results and obtain summary
plot(Fit)
summary(Fit)



