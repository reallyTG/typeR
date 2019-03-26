library(mizer)


### Name: set_trait_model
### Title: Sets up parameters for a trait-based model
### Aliases: set_trait_model

### ** Examples

## Not run: 
##D trait_params <- set_trait_model(no_sp = 15)
##D init_pop <- get_initial_n(trait_params, n0_mult = 0.001)
##D sim <- project(trait_params, effort = 0, t_max = 50, dt=0.2,
##D     initial_n = init_pop, t_save = 1)
##D plot(sim)
##D ## Set up industrial fishery that only fishes on species with w_inf <= 500 g
##D ## And where the selectivity of the industrial fishery = w_inf * 0.05
##D no_sp <- 10
##D min_w_inf <- 10
##D max_w_inf <- 1e5
##D w_inf <- 10^seq(from=log10(min_w_inf), to = log10(max_w_inf), length=no_sp)
##D knife_edges <- w_inf * 0.05
##D industrial_gears <- w_inf <= 500
##D other_gears <- w_inf > 500
##D gear_names <- rep("Industrial", no_sp)
##D gear_names[other_gears] <- "Other"
##D params_gear <- set_trait_model(no_sp = no_sp, min_w_inf = min_w_inf,
##D     max_w_inf = max_w_inf, knife_edge_size = knife_edges, 
##D     gear_names = gear_names)
##D ## Only turn on Industrial fishery. Set effort of the Other gear to 0
##D sim <- project(params_gear, t_max = 20, effort = c(Industrial = 1, Other = 0))
## End(Not run)



