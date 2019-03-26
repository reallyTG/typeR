library(mizer)


### Name: addSpecies
### Title: Add more species into an ecosystem with background species.
### Aliases: addSpecies addSpecies,MizerParams-method

### ** Examples

## Not run: 
##D params <- set_scaling_model(max_w_inf = 5000)
##D params <- setBackground(params)
##D a_m <- 0.0085
##D b_m <- 3.11
##D L_inf_m <- 24.3
##D L_mat <- 11.1
##D species_params <- data.frame(
##D     species = "mullet",
##D     w_min = 0.001, 
##D     w_inf = a_m*L_inf_m^b_m, 
##D     w_mat = a_m*L_mat^b_m, 
##D     beta = 283, 
##D     sigma = 1.8, 
##D     z0 = 0,
##D     alpha = 0.6,
##D     sel_func = "knife_edge", 
##D     knife_edge_size = 100, 
##D     gear = "knife_edge_gear",
##D     k = 0,
##D     k_vb = 0.6,
##D     a = a_m,
##D     b = b_m
##D )
##D params <- addSpecies(params, species_params)
##D plotSpectra(params)
##D sim <- project(params, t_max=50)
##D plotBiomass(sim)
## End(Not run)



