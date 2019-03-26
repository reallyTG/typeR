library(treatSens)


### Name: treatSens.BART
### Title: Dual-Parameter Sensitivity Analysis Using BART
### Aliases: treatSens.BART

### ** Examples

N <- 250                      # number of observations

zetay <- 0.5                  # coefficient on U in the outcome model
zetaz <- 0.5                  # coefficient on U in the treatment model
betaz <- c(0.75, -0.5,  0.25) # coefficients of X in the treatment model
betay <- c(0.5,   1.0, -1.5)  # coefficients of X in the outcome model
tau   <- 0.25                 # treatment effect

set.seed(725)
X <- matrix(rnorm(3 * N), N)  # covariates

U  <- rbinom(N, 1, 0.5)                        # unmeasured confounder
ps <- pnorm(X %*% betaz + zetaz * (U - 0.5)) # propensity score
Z  <- rbinom(N, 1, ps)                         # treatment variable
epsilon <- rnorm(N, 0.0, 2.0)                  # error term

Y0 <- X %*% betay + zetay * (U - 0.5) + epsilon       # potential outcome(Z=0)
Y1 <- X %*% betay + zetay * (U - 0.5) + tau + epsilon # potential outcome(Z=1)
Y  <- Y0 * (1 - Z) + Y1 * Z                             # realization of potential outcome

# sensitivity analysis
out.bin <- treatSens.BART(Y ~ Z + X, nsim = 3, nthin = 2, nburn = 0,
                          spy.range = c(0, 4), spz.range = c(-2 , 2), grid.dim = c(5, 3),
                          standardize = FALSE, verbose = TRUE)

sensPlot(out.bin) # draw contour plot




