library(BLSM)


### Name: plot_traceplots_acf
### Title: BLSM traceplots and ACF
### Aliases: plot_traceplots_acf

### ** Examples

plot_traceplots_acf(example_blsm_obj, chosen_node=3, coordinate=1)

## Not run: 
##D  # Run the simulation without Procrustean step
##D  blsm_obj = estimate_latent_positions(example_adjacency_matrix, procrustean = FALSE, 
##D                           burn_in = 3*10^4, nscan = 10^5)
##D  
##D  # Plot 
##D  plot_traceplots_acf(blsm_obj, chosen_pair=c(2,5))
## End(Not run)



