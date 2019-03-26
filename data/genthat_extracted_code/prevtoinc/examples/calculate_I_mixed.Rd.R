library(prevtoinc)


### Name: calculate_I_mixed
### Title: Function to calculate incidence from PPS data using a mix of two
###   estimators
### Aliases: calculate_I_mixed

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
I.1 <- calculate_I_smooth(data = data.pps.fast,
                   method = "gren")
                   
# estimate incidence based on Rhame-Sudderth formula
I.2 <- calculate_I_rhame(data = data.pps.fast,
                   x.loi.hat = 8,
                   x.los.hat = 13)

# mixed estimator                                      
calculate_I_mixed(I.1, I.2)




