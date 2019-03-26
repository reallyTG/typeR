library(scanstatistics)


### Name: scan_eb_negbin
### Title: Calculate the expectation-based negative binomial scan
###   statistic.
### Aliases: scan_eb_negbin

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
##D  baselines <- matrix(rexp(n_total, 1/5), max_duration, n_locs)
##D  thetas <- matrix(runif(n_total, 0.05, 3), max_duration, n_locs)
##D  counts <- matrix(rnbinom(n_total,  mu = baselines,  size = thetas), 
##D                   max_duration, n_locs)
##D 
##D # Inject outbreak/event/anomaly
##D ob_dur <- 3
##D ob_cols <- zones[[10]]
##D ob_rows <- max_duration + 1 - seq_len(ob_dur)
##D counts[ob_rows, ob_cols] <- matrix(
##D   rnbinom(ob_dur * length(ob_cols), 
##D           mu = 2 * baselines[ob_rows, ob_cols],
##D           size = thetas[ob_rows, ob_cols]),
##D   length(ob_rows), length(ob_cols))
##D res <- scan_eb_negbin(counts = counts,
##D                       zones = zones,
##D                       baselines = baselines,
##D                       thetas = thetas,
##D                       type = "hotspot",
##D                       n_mcsim = 99,
##D                       max_only = FALSE)
## End(Not run)



