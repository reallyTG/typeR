library(simstandard)


### Name: add_factor_scores
### Title: Add factor scores to observed data
### Aliases: add_factor_scores

### ** Examples

library(simstandard)
# lavaan model
m = "
X =~ 0.9 * X1 + 0.8 * X2 + 0.7 * X3
"

# Make data.frame for two cases
d <- data.frame(
  X1 = c(1.2, -1.2),
  X2 = c(1.5, -1.8),
  X3 = c(1.8, -1.1))

# Compute factor scores for two cases
add_factor_scores(d, m)



