library(prevtoinc)


### Name: calculate_I_smooth
### Title: Estimate the incidence based on PPS data using monotone
###   estimators for the distribution of A.
### Aliases: calculate_I_smooth

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

# estimate of incidence
calculate_I_smooth(data = data.pps.fast,
                   method = "gren")





