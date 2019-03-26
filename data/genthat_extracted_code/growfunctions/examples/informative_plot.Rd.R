library(growfunctions)


### Name: informative_plot
### Title: Plot credible intervals for parameters to compare ignoring with
###   weighting an informative sample
### Aliases: informative_plot

### ** Examples

## Not run: 
##D library(growfunctions)
##D ## use gen_informative_sample() to generate an 
##D ## N X T population drawn from a dependent GP
##D ## By default, 3 clusters are used to generate 
##D ## the population.
##D ## A single stage stratified random sample of size n 
##D ## is drawn from the population using I = 4 strata. 
##D ## The resulting sample is informative in that the 
##D ## distribution for this sample is
##D ## different from the population from which 
##D ## it was drawn because the strata inclusion
##D ## probabilities are proportional to a feature 
##D ## of the response, y (in the case, the variance.
##D ## The stratified random sample over-samples 
##D ## large variance strata).
##D ## (The user may also select a 2-stage 
##D ## sample with the first stage
##D ## sampling "blocks" of the population and 
##D ## the second stage sampling strata within blocks). 
##D dat_sim        <- gen_informative_sample(N= 10000, 
##D                                 n = 500, T = 5,
##D                                 noise_to_signal = 0.1)
##D 
##D y_obs                       <- dat_sim$y_obs
##D T                           <- ncol(y_obs)
##D 
##D an informative sampling design that inputs inclusion
##D probabilities, ipr
##D res_gp_w            <- gpdpgrow(y = y_obs, 
##D                                ipr = dat_sim$map_obs$incl_prob, 
##D                                n.iter = 5, n.burn = 2,  
##D                                n.thin = 1, n.tune = 0)
##D and fit vs. data for experimental units
##D fit_plots_w         <- cluster_plot( object = res_gp_w,  
##D                            units_name = "establishment", 
##D                            units_label = dat_sim$map_obs$establishment, 
##D                            single_unit = FALSE, credible = TRUE )
##D 
##D ## estimate parameters ignoring sampling design
##D res_gp_i            <- gpdpgrow(y = y_obs, 
##D                                n.iter = 5, n.burn = 2, 
##D                                n.thin = 1, n.tune = 0)
##D ## plots of estimated functions, faceted by cluster and fit vs. 
##D ## data for experimental units
##D fit_plots_i         <- cluster_plot( object = res_gp_i,  
##D                                     units_name = "establishment", 
##D                                     units_label = dat_sim$map_obs$establishment, 
##D                                     single_unit = FALSE, credible = TRUE )
##D 
##D ## We also draw an iid (non-informative, exchangeable) 
##D ## sample from the same population to 
##D ## compare estimation results to our weighted 
##D ## (w) and unweighted/ignoring (i) models
##D 
##D ## estimate parameters under an iid sampling design
##D res_gp_iid          <- gpdpgrow(y = dat_sim$y_iid, 
##D                                n.iter = 5, n.burn = 2,   
##D                                n.thin = 1, n.tune = 0)
##D ## plots of estimated functions, faceted by cluster and 
##D ## fit vs. data for experimental units
##D fit_plots_iid       <- cluster_plot( object = res_gp_iid,  
##D                            units_name = "establishment", 
##D                            units_label = dat_sim$map_iid$establishment, 
##D                            single_unit = FALSE, credible = TRUE )
##D 
##D ## compare estimations of covariance parameter credible 
##D ## intervals when ignoring informativeness vs.
##D ## weighting to account for informativeness
##D objects                  <- map <- vector("list",3)
##D objects[[1]]             <- res_gp_i
##D objects[[2]]             <- res_gp_iid
##D objects[[3]]             <- res_gp_w
##D map[[1]]                 <- fit_plots_i$map
##D map[[2]]                 <- fit_plots_iid$map
##D map[[3]]                 <- fit_plots_w$map
##D objects_labels           <- c("ignore","iid","weight")
##D 
##D parms_plots_compare      <- informative_plot( objects = objects, 
##D                                 objects_labels = objects_labels,
##D                                 map = map, units_name = "establishment", 
##D                                 model = "gp",
##D                                 true_star = dat_sim$theta_star, 
##D                                 map_true = dat_sim$map_obs)
##D 
## End(Not run)



