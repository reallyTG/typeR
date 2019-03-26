library(prevtoinc)


### Name: calculate_I_rhame
### Title: Function to calculate incidence from PPS data using a
###   Rhame-Sudderth like approach with estimates for x.loi and x.los
###   supplied.
### Aliases: calculate_I_rhame

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
calculate_I_rhame(data = data.pps.fast,
                   x.loi.hat = 8,
                   x.los.hat = 13)




