library(quickmatch)


### Name: covariate_averages
### Title: Covariate averages in matched sample
### Aliases: covariate_averages

### ** Examples

# Construct example data
my_data <- data.frame(y = rnorm(100),
                      x1 = runif(100),
                      x2 = runif(100),
                      treatment = factor(sample(rep(c("T1", "T2", "C"), c(25, 25, 50)))))

# Make distances
my_distances <- distances(my_data, dist_variables = c("x1", "x2"))

# Treatment group averages in unmatched sample
covariate_averages(my_data$treatment, my_data[c("x1", "x2")])

# Make matching
my_matching <- quickmatch(my_distances, my_data$treatment)

# Treatment group averages in matched sample
covariate_averages(my_data$treatment, my_data[c("x1", "x2")], my_matching)

# Averages in matched sample for ATT
covariate_averages(my_data$treatment,
                   my_data[c("x1", "x2")],
                   my_matching,
                   target = c("T1", "T2"))

# Second-order moments and interactions
mod_covs <- data.frame(x1 = my_data$x1,
                       x2 = my_data$x2,
                       x1sq = my_data$x1^2,
                       x2sq = my_data$x2^2,
                       x1x2 = my_data$x1 * my_data$x2)
covariate_averages(my_data$treatment, mod_covs, my_matching)




