library(INDperform)


### Name: compare_thresholds
### Title: Compare changes in t_var based on different threshold levels.
### Aliases: compare_thresholds
### Keywords: internal

### ** Examples

t_var <- rnorm(20)
lower <- stats::quantile(t_var, prob = .2, na.rm = TRUE)
upper <- stats::quantile(t_var, prob = .8, na.rm = TRUE)
t_val <- seq(from = lower, to = upper, by = (upper - lower) / 20)
compare_thresholds(t_val, t_var)



