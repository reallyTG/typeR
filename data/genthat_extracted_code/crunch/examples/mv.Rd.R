library(crunch)


### Name: mv
### Title: Functions to manipulate variables' or project's folder structure
### Aliases: mv mkdir

### ** Examples

## Not run: 
##D ds <- loadDataset("Example survey")
##D ds <- mv(ds, c("gender", "age", "educ"), "Demographics")
##D ds <- mkdir(ds, "Key Performance Indicators/Brand X")
##D # These can also be chained together
##D require(magrittr)
##D ds <- ds %>%
##D     mv(c("aware_x", "nps_x"), "Key Performance Indicators/Brand X") %>%
##D     mv(c("aware_y", "nps_y"), "Key Performance Indicators/Brand Y")
##D # Can combine with cd() and move things with relative paths
##D ds %>%
##D     cd("Key Performance Indicators/Brand X") %>%
##D     mv("nps_x", "../Net Promoters")
##D # Can combine with folder() to move objects to the same place as something else
##D ds %>% mv("nps_y", folder(ds$nps_x))
##D # Now let's put ds in a Project
##D projects() %>%
##D     mv(ds, "Brand Tracking Studies")
## End(Not run)



