library(scanstatistics)


### Name: scan_bayes_negbin
### Title: Calculate the negative binomial bayesian scan statistic..
### Aliases: scan_bayes_negbin

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
##D baselines <- matrix(rexp(n_total, 1/5), max_duration, n_locs)
##D counts <- matrix(rpois(n_total, as.vector(baselines)), max_duration, n_locs)
##D 
##D # Inject outbreak/event/anomaly
##D ob_dur <- 3
##D ob_cols <- zones[[10]]
##D ob_rows <- max_duration + 1 - seq_len(ob_dur)
##D counts[ob_rows, ob_cols] <- matrix(
##D   rpois(ob_dur * length(ob_cols), 2 * baselines[ob_rows, ob_cols]), 
##D   length(ob_rows), length(ob_cols))
##D res <- scan_bayes_negbin(counts = counts,
##D                          zones = zones,
##D                          baselines = baselines)
## End(Not run)



