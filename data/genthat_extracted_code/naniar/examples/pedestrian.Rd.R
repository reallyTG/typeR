library(naniar)


### Name: pedestrian
### Title: Pedestrian count information around Melbourne for 2016
### Aliases: pedestrian
### Keywords: datasets

### ** Examples

## Not run: 
##D # explore the missingness with vis_miss
##D library(naniar)
##D 
##D vis_miss(pedestrian)
##D 
##D # Look at the missingness in the variables
##D miss_var_summary(pedestrian)
##D 
##D # There is only missingness in hourly_counts
##D # Look at the missingness over a rolling window
##D library(ggplot2)
##D gg_miss_span(pedestrian, hourly_counts, span_every = 3000)
## End(Not run)



