library(Surrogate)


### Name: plot TrialLevelIT
### Title: Provides a plots of trial-level surrogacy in the
###   information-theoretic framework based on the output of the
###   'TrialLevelIT()' function
### Aliases: plot.TrialLevelIT
### Keywords: Plot surrogacy Information-theoretic framework Trial-level
###   surrogacy Multiple-trial setting

### ** Examples

# Generate vector treatment effects on S
set.seed(seed = 1)
Alpha.Vector <- seq(from = 5, to = 10, by=.1) + runif(min = -.5, max = .5, n = 51)

# Generate vector treatment effects on T
set.seed(seed=2)
Beta.Vector <- (Alpha.Vector * 3) + runif(min = -5, max = 5, n = 51)

# Apply the function to estimate R^2_{h.t}
Fit <- TrialLevelIT(Alpha.Vector=Alpha.Vector,
Beta.Vector=Beta.Vector, N.Trial=50, Model="Reduced")

# Plot the results
plot(Fit)



