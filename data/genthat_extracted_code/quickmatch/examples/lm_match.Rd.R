library(quickmatch)


### Name: lm_match
### Title: Regression-based matching estimator of treatment effects
### Aliases: lm_match

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

# ATE without covariates
lm_match(my_data$y,
         my_data$treatment,
         my_matching)

# ATE with covariates
lm_match(my_data$y,
         my_data$treatment,
         my_matching,
         my_data[c("x1", "x2")])

# ATT for T1
lm_match(my_data$y,
         my_data$treatment,
         my_matching,
         my_data[c("x1", "x2")],
         target = "T1")




