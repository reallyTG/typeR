library(pooling)


### Name: plot_dfa2
### Title: Plot Log-OR vs. X for Gamma Discriminant Function Approach
### Aliases: plot_dfa2

### ** Examples

# Fit Gamma discriminant function model for poolwise Xtilde vs. (Y, C),
# without assuming a constant log-OR. Ignoring processing errors for simplicity.
data(pdat2)
data(pdat2_c)
fit <- p_dfa_xerrors2(g = pdat2$g, y = pdat2$y, xtilde = pdat2$xtilde,
                      c = pdat2_c, errors = "neither", constant_or = FALSE)

# Plot estimated log-OR vs. X at mean value for C
p <- plot_dfa2(estimates = fit$estimates, varcov = fit$theta.var,
               xrange = range(pdat2$xtilde / pdat2$g),
               cvals = mean(unlist(pdat2_c)))
p





