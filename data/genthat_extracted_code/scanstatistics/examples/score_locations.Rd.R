library(scanstatistics)


### Name: score_locations
### Title: Score each location over zones and duration.
### Aliases: score_locations

### ** Examples

## Not run: 
##D # Simple example
##D set.seed(1)
##D table <- data.frame(zone = 1:5, duration = 1, score = 5:1)
##D zones <- list(1:2, 1:3, 2:5, 4:5, c(1, 5))
##D x <- list(table = table, n_locations = 5, max_duration = 1, n_zones = 5)
##D score_locations(x, zones)
## End(Not run)



