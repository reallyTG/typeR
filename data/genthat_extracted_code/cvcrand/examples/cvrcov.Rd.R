library(cvcrand)


### Name: cvrcov
### Title: Covariate-constrained randomization for cluster randomized
###   trials
### Aliases: cvrcov
### Keywords: cluster constrained covariate-by-covariate randomization
###   randomized trails,

### ** Examples


# cvcrand example

Dickinson_design_numeric <- Dickinson_design
Dickinson_design_numeric$location = (Dickinson_design$location == "Rural") * 1
Design_cov_result <- cvrcov(clustername = Dickinson_design_numeric$county,
                            x = data.frame(Dickinson_design_numeric[ , c(2, 3, 5, 7, 11)]),
                            ntotal_cluster = 16,
                            ntrt_cluster = 8,
                            constraints = c("s5", "mf.5", "any", "any", "mf0.4"), 
                            categorical = c("location"),
                            savedata = "dickinson_cov_constrained.csv",
                            seed = 12345, 
                            check_validity = TRUE)




