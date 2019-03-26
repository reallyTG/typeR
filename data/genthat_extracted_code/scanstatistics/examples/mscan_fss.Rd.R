library(scanstatistics)


### Name: mscan_fss
### Title: Compute the Fast Subset Scan statistic for multivariate
###   space-time data.
### Aliases: mscan_fss
### Keywords: internal

### ** Examples

## Not run: 
##D # Set simulation parameters (small)
##D set.seed(1)
##D n_loc <- 20
##D n_dur <- 10
##D n_streams <- 2
##D n_tot <- n_loc * n_dur * n_streams
##D 
##D # Create locations and kNN matrix
##D geo <- data.frame(x = rnorm(n_loc), y = rnorm(n_loc))
##D knn_mat <- coords_to_knn(geo, k = 10)
##D 
##D # Generate baselines and possibly other distribution parameters
##D baselines <- rexp(n_tot, 1/5) + rexp(n_tot, 1/5)
##D sigma2s <- rexp(n_tot)
##D 
##D # Generate counts
##D counts <- rpois(n_tot, baselines)
##D 
##D # Reshape into arrays
##D counts <- array(counts, c(n_dur, n_loc, n_streams))
##D baselines <- array(baselines, c(n_dur, n_loc, n_streams))
##D sigma2s <- array(sigma2s, c(n_dur, n_loc, n_streams))
##D 
##D # Inject an outbreak/event
##D ob_loc <- 1:floor(n_loc / 4)
##D ob_dur <- 1:floor(n_dur / 4)
##D ob_streams <- 1:floor(n_streams / 2)
##D counts[ob_dur, ob_loc, ob_streams] <- 4 * counts[ob_dur, ob_loc, ob_streams]
##D 
##D # Run the Subset Aggregation FN algorithm
##D FN_res <- mscan_fss(
##D   counts = counts,
##D   distribution = "poisson",
##D   algorithm = "naive_streams"
##D   parameters = list(baselines = baselines))
##D   
##D # Run the FF algorithm (few random restarts)
##D FF_res <- mscan_fss(
##D   counts = counts,
##D   distribution = "gaussian",
##D   algorithm = "fast"
##D   parameters = list(baselines = baselines, variances = variances),
##D   knn_matrix = knn_mat,
##D   R = 10)
## End(Not run)



