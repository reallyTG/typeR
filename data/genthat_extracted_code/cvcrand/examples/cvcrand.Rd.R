library(cvcrand)


### Name: cvcrand
### Title: Covariate-constrained randomization for cluster randomized
###   trials
### Aliases: cvcrand cvcrand cvcrand-package
### Keywords: cluster constrained randomization randomized trails,

### ** Examples


# cvcrand example

Design_result <- cvcrand(clustername = Dickinson_design$county,
                         balancemetric = "l2",
                         x = data.frame(Dickinson_design[ , c(2, 3, 5, 7, 10)]),
                         ntotal_cluster = 16,
                         ntrt_cluster = 8,
                         categorical = c("location", "incomecat"),
                         savedata = "dickinson_constrained.csv",
                         savebscores = "dickinson_bscores.csv",
                         cutoff = 0.1,
                         seed = 12345)

# cvcrand example with weights specified

Design_result <- cvcrand(clustername = Dickinson_design$county,
                         balancemetric = "l2",
                         x = data.frame(Dickinson_design[ , c(2, 3, 5, 7, 10)]),
                         ntotal_cluster = 16,
                         ntrt_cluster = 8,
                         categorical = c("location", "incomecat"),
                         weights = c(1, 1, 1, 1, 1),
                         cutoff = 0.1,
                         seed = 12345)

# Stratification on location, with constrained
# randomization on other specified covariates

 Design_stratified_result <- cvcrand(clustername = Dickinson_design$county,
                                     balancemetric = "l2",
                                     x = data.frame(Dickinson_design[ , c(2, 3, 5, 7, 10)]),
                                     ntotal_cluster = 16,
                                     ntrt_cluster = 8,
                                     categorical = c("location", "incomecat"),
                                     weights = c(1000, 1, 1, 1, 1),
                                     cutoff = 0.1,
                                     seed = 12345)

 # An alternative and equivalent way to stratify on location

 Design_stratified_result <- cvcrand(clustername = Dickinson_design$county,
                                     balancemetric = "l2",
                                     x = data.frame(Dickinson_design[ , c(2, 3, 5, 7, 10)]),
                                     ntotal_cluster = 16,
                                     ntrt_cluster = 8,
                                     categorical = c("location", "incomecat"),
                                     stratify = "location",
                                     cutoff = 0.1,
                                     seed = 12345)

 # Stratification on income category
 #Two of the income categories contain an odd number of clusters
 # Stratification is not strictly possible

 Design_stratified_inc_result <- cvcrand(clustername = Dickinson_design$county,
                                         balancemetric = "l2",
                                         x = data.frame(Dickinson_design[ , c(2, 3, 5, 7, 10)]),
                                         ntotal_cluster = 16,
                                         ntrt_cluster = 8,
                                         categorical = c("location", "incomecat"),
                                         stratify = "incomecat",
                                         cutoff = 0.1,
                                         seed = 12345)





