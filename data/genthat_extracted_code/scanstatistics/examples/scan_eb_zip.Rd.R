library(scanstatistics)


### Name: scan_eb_zip
### Title: Calculate the expectation-based ZIP scan statistic.
### Aliases: scan_eb_zip

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
##D probs <- matrix(runif(n_total) / 4, max_duration, n_locs)
##D counts <- gamlss.dist::rZIP(n_total, baselines, probs)
##D 
##D # Inject outbreak/event/anomaly
##D ob_dur <- 3
##D ob_cols <- zones[[10]]
##D ob_rows <- max_duration + 1 - seq_len(ob_dur)
##D counts[ob_rows, ob_cols] <- gamlss.dist::rZIP(
##D   ob_dur * length(ob_cols), 2 * baselines[ob_rows, ob_cols], 
##D   probs[ob_rows, ob_cols])
##D res <- scan_eb_zip(counts = counts,
##D                    zones = zones,
##D                    baselines = baselines,
##D                    probs = probs,
##D                    n_mcsim = 99,
##D                    max_only = FALSE,
##D                    rel_tol = 1e-3)
## End(Not run)



