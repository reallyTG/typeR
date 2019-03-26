library(prevtoinc)


### Name: calculate_I
### Title: Function to calculate different estimators for I from PPS data.
### Aliases: calculate_I

### ** Examples


# create example data for PPS
example.dist <- create_dist_vec(function(x) dpois(x-1, 7), max.dist = 70)
example.dist.los <- create_dist_vec(function(x) dpois(x-1, lambda = 12),
                                    max.dist = 70)
data.pps.fast <- simulate_pps_fast(n.sample=200,
                                   P=0.05,
                                   dist.X.loi = example.dist,
                                   dist.X.los = example.dist.los)
head(data.pps.fast)

# estimate incidence based on Rhame-Sudderth formula
calculate_I(data = data.pps.fast)




