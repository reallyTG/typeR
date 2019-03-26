library(visdat)


### Name: vis_miss
### Title: Visualise a data.frame to display missingness.
### Aliases: vis_miss

### ** Examples


vis_miss(airquality)

## Not run: 
##D vis_miss(airquality, cluster = TRUE)
##D 
##D vis_miss(airquality, sort_miss = TRUE)
##D 
##D # if you have a large dataset, you might want to try downsampling:
##D library(nycflight13)
##D library(dplyr)
##D flights %>%
##D   sample_n(1000) %>%
##D   vis_miss()
##D 
##D flights %>%
##D   slice(1:1000) %>%
##D   vis_miss()
##D 
## End(Not run)




