library(Surrogate)


### Name: TrialLevelIT
### Title: Estimates trial-level surrogacy in the information-theoretic
###   framework
### Aliases: TrialLevelIT
### Keywords: Multiple-trial setting Information-theoretic framework
###   Trial-level surrogacy

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

summary(Fit)
plot(Fit)



