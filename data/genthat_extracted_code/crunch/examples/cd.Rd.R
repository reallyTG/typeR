library(crunch)


### Name: cd
### Title: Change to different folder
### Aliases: cd

### ** Examples

## Not run: 
##D ds <- loadDataset("Example survey")
##D demo <- cd(ds, "Demographics")
##D names(demo)
##D # Or with %>%
##D require(magrittr)
##D ds <- ds %>%
##D     cd("Demographics") %>%
##D     names()
##D # Can combine with mv() and move things with relative paths
##D ds %>%
##D     cd("Key Performance Indicators/Brand X") %>%
##D     mv("nps_x", "../Net Promoters")
## End(Not run)



