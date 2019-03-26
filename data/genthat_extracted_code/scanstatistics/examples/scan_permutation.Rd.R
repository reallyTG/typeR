library(scanstatistics)


### Name: scan_permutation
### Title: Calculate the space-time permutation scan statistic.
### Aliases: scan_permutation

### ** Examples

## Not run: 
##D set.seed(1)
##D # Create location coordinates, calculate nearest neighbors, and create zones
##D n_locs <- 50
##D max_duration <- 5
##D n_total <- n_locs * max_duration
##D geo <- matrix(rnorm(n_locs * 2), n_locs, 2)
##D knn_mat <- coords_to_knn(geo, 15)
##D zones <- knn_zones(knn_mat)
##D 
##D # Simulate data
##D population <- matrix(rnorm(n_total, 100, 10), max_duration, n_locs)
##D counts <- matrix(rpois(n_total, as.vector(population) / 20), 
##D                  max_duration, n_locs)
##D 
##D # Inject outbreak/event/anomaly
##D ob_dur <- 3
##D ob_cols <- zones[[10]]
##D ob_rows <- max_duration + 1 - seq_len(ob_dur)
##D counts[ob_rows, ob_cols] <- matrix(
##D   rpois(ob_dur * length(ob_cols), 2 * population[ob_rows, ob_cols] / 20), 
##D   length(ob_rows), length(ob_cols))
##D res <- scan_permutation(counts = counts,
##D                            zones = zones,
##D                            population = population,
##D                            n_mcsim = 99,
##D                            max_only = FALSE)
## End(Not run)



