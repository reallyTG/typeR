library(BNPMIXcluster)


### Name: MIXclustering
### Title: Bayesian Nonparametric Model for Clustering with Mixed Scale
###   Variables
### Aliases: MIXclustering

### ** Examples


##############################
#     Simulation study 1     #
#    Carmona et al. (2017)   #
##############################

# Data and parameters are discussed in section 5.1 of Carmona et al. (2017) #

# Set seed for reproducibility #
set.seed(0) 


# Specification of data Y #
help(Y_ex_5_1)
# Choose 1, 2, or 3 #
ex_i <- 1

# specification of parameters #
help(meta_param_ex)
# Choose "a", "b" or "c" #
param_j <- "c"

var_type_Y_ex_5_1 <- list( c("c","c","c"),
                           c("o","o"),
                           c("o","o","o","c") )
## Not run: 
##D cluster_ex <- MIXclustering( Y = as.matrix(Y_ex_5_1[[ ex_i ]]),
##D                              var_type=var_type_Y_ex_5_1[[ ex_i ]],
##D                              
##D                              n_iter_out=1500,
##D                              n_burn=200,
##D                              n_thin=3,
##D                              
##D                              alpha = meta_param_ex[ param_j, "alpha" ],
##D                              d_0_a = meta_param_ex[ param_j, "d_0_a"],
##D                              d_1_a = meta_param_ex[ param_j, "d_1_a" ],
##D                              d_0_b = meta_param_ex[ param_j, "d_0_b" ],
##D                              d_1_b = meta_param_ex[ param_j, "d_1_b" ],
##D                              eta = meta_param_ex[ param_j, "eta" ],
##D                              kappa = meta_param_ex[ param_j, "kappa" ],
##D                              delta = meta_param_ex[ param_j, "delta" ],
##D                              
##D                              d_0_z = meta_param_ex[ param_j, "d_0_z" ],
##D                              d_1_z = meta_param_ex[ param_j, "d_1_z" ],
##D                              d_0_mu = meta_param_ex[ param_j, "d_0_mu" ],
##D                              d_1_mu = meta_param_ex[ param_j, "d_1_mu" ] )
##D # Summary of clustering results
##D summary(cluster_ex)
##D 
##D # Representation of clustering results
##D plot(cluster_ex,type="heatmap")
##D plot(cluster_ex,type="chain")
##D 
##D # Comparison of cluster configurations #
##D # 1) Minimum distance with average MCMC iterations
##D # 2) Minimum Heterogeneity Measure (HM)
##D plot( x=jitter(cluster_ex$cluster),y=jitter(cluster_ex$clusterHMmin), col="#FF000080", pch=20,
##D       main=paste("Comparison of two relevant cluster configurations"),
##D       xlab="minimizes distance to average MCMC grouping", ylab="minimizes Heterogeneity Measure" )
##D 
##D # Comparison with the original clusters in the simulated data
##D plot(x=jitter(Z_latent_ex_5_1$cluster),
##D      y=jitter(cluster_ex$cluster),
##D      main=paste("Comparison real configuration with the model results"),
##D      xlab="Real cluster",
##D      ylab="Model cluster",
##D      pch=19, col="#FF000080")
## End(Not run)

##############################
#      Households data       #
#    Carmona et al. (2017)   #
##############################

# Testing "MIXclustering" function with poverty.data #
# Data and parameters are discussed in section 5.3 of Carmona et al. (2017) #

# Set seed for reproducibility #
set.seed(0) 


## Not run: 
##D # relevant variables for clustering households #
##D Y_names <- c("ict_norm",
##D              "ic_ali","ic_asalud","ic_cv",
##D              "ic_rezedu","ic_sbv","ic_segsoc",
##D              "niv_ed","tam_loc")
##D Y_var_type <- c("c","o","o","o","o","o","o","o","m")
##D 
##D # using only data from state 15 (Edomex) #
##D aux_subset <- rep(T,nrow(poverty.data))
##D aux_subset <- aux_subset & is.element(substr(poverty.data$folioviv,1,2),"15")
##D 
##D Y_data <- poverty.data[aux_subset,Y_names]
##D 
##D ### Sampling probability dependin on the scenario ###
##D # Scenario description in section 5.3 of Carmona et al. (2017) #
##D # Choose 1, 2 or 3 #
##D poverty_sampling_spec <- 3
##D 
##D 
##D if (poverty_sampling_spec == 1) {
##D   k <- 1
##D   sampling_prob_pov <- rep(1,nrow(Y_data))
##D } else if (poverty_sampling_spec == 2) {
##D   k <- 2 * mean(poverty.data[aux_subset,"factor_hog"])
##D   sampling_prob_pov <- 1/poverty.data[aux_subset,"factor_hog"]
##D } else if (poverty_sampling_spec == 3) {
##D   k <- 4 * mean(poverty.data[aux_subset,"factor_hog"])
##D   sampling_prob_pov <- 1/poverty.data[aux_subset,"factor_hog"]
##D }
##D 
##D cluster_poverty <- MIXclustering( Y=Y_data,
##D                                   var_type=Y_var_type,
##D                                   n_iter_out=1500,
##D                                   n_burn=200,
##D                                   n_thin=3,
##D                                   
##D                                   alpha = 0.5,
##D                                   d_0_a = 1, d_1_a = 1,
##D                                   d_0_b = 1, d_1_b = 1,
##D                                   
##D                                   eta = 2,
##D                                   kappa = 5,
##D                                   delta = 4,
##D                                   
##D                                   d_0_z = 2.1, d_1_z = 30,
##D                                   d_0_mu = 2.1, d_1_mu = 30,
##D                                   
##D                                   sampling_prob = k * sampling_prob_pov )
##D 
##D summary(cluster_poverty)
##D plot(cluster_poverty,type="heatmap")
##D plot(cluster_poverty,type="chain")
## End(Not run)




