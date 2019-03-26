library(pooling)


### Name: plot_dfa
### Title: Plot Log-OR vs. X for Normal Discriminant Function Approach
### Aliases: plot_dfa

### ** Examples

# Fit discriminant function model for poolwise Xtilde vs. (Y, C), without
# assuming a constant log-OR. Ignoring processing errors for simplicity.
data(pdat1)
fit <- p_dfa_xerrors(g = pdat1$g, y = pdat1$numcases, xtilde = pdat1$xtilde,
                     c = pdat1$c, errors = "neither", constant_or = FALSE)

# Plot estimated log-OR vs. X at mean value for C
p <- plot_dfa(estimates = fit$estimates, varcov = fit$theta.var,
              xrange = range(pdat1$xtilde / pdat1$g),
              cvals = mean(pdat1$c / pdat1$g))
p





