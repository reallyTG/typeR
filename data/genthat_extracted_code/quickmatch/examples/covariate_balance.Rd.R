library(quickmatch)


### Name: covariate_balance
### Title: Covariate balance in matched sample
### Aliases: covariate_balance

### ** Examples

# Construct example data
my_data <- data.frame(y = rnorm(100),
                      x1 = runif(100),
                      x2 = runif(100),
                      treatment = factor(sample(rep(c("T1", "T2", "C"), c(25, 25, 50)))))

# Make distances
my_distances <- distances(my_data, dist_variables = c("x1", "x2"))

# Balance in unmatched sample (maximum for each covariate)
covariate_balance(my_data$treatment, my_data[c("x1", "x2")])

# Make matching
my_matching <- quickmatch(my_distances, my_data$treatment)

# Balance in matched sample (maximum for each covariate)
covariate_balance(my_data$treatment, my_data[c("x1", "x2")], my_matching)

# Balance in matched sample for ATT
covariate_balance(my_data$treatment,
                  my_data[c("x1", "x2")],
                  my_matching,
                  target = c("T1", "T2"))

# Balance on second-order moments and interactions
balance_cov <- data.frame(x1 = my_data$x1,
                          x2 = my_data$x2,
                          x1sq = my_data$x1^2,
                          x2sq = my_data$x2^2,
                          x1x2 = my_data$x1 * my_data$x2)
covariate_balance(my_data$treatment, balance_cov, my_matching)

# Report all differences (not only maximum for each covariate)
covariate_balance(my_data$treatment,
                  my_data[c("x1", "x2")],
                  my_matching,
                  all_differences = TRUE)




