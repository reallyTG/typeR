library(scoringRules)


### Name: scores_sample_univ
### Title: Scoring Rules for Simulated Forecast Distributions
### Aliases: scores_sample_univ crps_sample logs_sample dss_sample

### ** Examples

## Not run: 
##D 
##D # y has length greater than 1
##D y <- 1:2
##D sample <- matrix(rnorm(20), nrow = 2)
##D crps_sample(y = y, dat = sample)
##D logs_sample(y = y, dat = sample)
##D 
##D y <- 1:2
##D sample <- rnorm(10)
##D crps_sample(y = y, dat = sample) # error
##D 
##D # y has length 1
##D y <- 1
##D sample <- rnorm(10)
##D crps_sample(y = y, dat = sample)
##D 
##D sample <- matrix(rnorm(10), nrow = 1)
##D crps_sample(y = y, dat = sample)
##D 
##D sample <- matrix(rnorm(20), nrow = 2)
##D crps_sample(y = y, dat = sample) # error
## End(Not run)




