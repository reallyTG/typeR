library(scanstatistics)


### Name: subset_aggregation_FF
### Title: Fast Subset Aggregation over both locations and data streams.
### Aliases: subset_aggregation_FF
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
##D # Run the FN algorithm
##D FF_res <- subset_aggregation_FF(
##D   list(counts = counts, baselines = baselines),
##D   score_fun = poisson_score,
##D   priority_fun = poisson_priority,
##D   algorithm = "FN")
## End(Not run)



