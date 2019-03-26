library(shar)


### Name: plot_randomized_pattern
### Title: plot_randomized_pattern
### Aliases: plot_randomized_pattern

### ** Examples

pattern_random <- fit_point_process(species_a, n_random = 19, process = "cluster")
plot_randomized_pattern(pattern_random)

plot_randomized_pattern(pattern_random, what = "pp")

## Not run: 
##D marks_sub <- spatstat::subset.ppp(species_a, select = dbh)
##D marks_recon <- reconstruct_marks(pattern_random[[1]], marks_sub, n_random = 19, max_runs = 1000)
##D plot_randomized_pattern(marks_recon, method = "marks")
## End(Not run)




