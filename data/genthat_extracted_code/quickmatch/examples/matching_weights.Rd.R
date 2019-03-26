library(quickmatch)


### Name: matching_weights
### Title: Unit weights implied by matching
### Aliases: matching_weights

### ** Examples

# Construct example data
my_data <- data.frame(y = rnorm(100),
                      x1 = runif(100),
                      x2 = runif(100),
                      treatment = factor(sample(rep(c("T1", "T2", "C"), c(25, 25, 50)))))

# Make distances
my_distances <- distances(my_data, dist_variables = c("x1", "x2"))

# Make matching
my_matching <- quickmatch(my_distances, my_data$treatment)

# Weights for ATE
weights_ate <- matching_weights(my_data$treatment, my_matching)

# Weights for ATT for T1
weights_att <- matching_weights(my_data$treatment, my_matching, target = "T1")

# Estimate treatment effects with WLS estimator (see `lm_match`)
effects <- lm(y ~ treatment + x1 + x2, data = my_data, weights = weights_att)




