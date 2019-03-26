library(visdat)


### Name: vis_dat
### Title: Visualises a data.frame to tell you what it contains.
### Aliases: vis_dat

### ** Examples


vis_dat(airquality)

## Not run: 
##D # experimental colourblind safe palette
##D vis_dat(airquality, palette = "cb_safe")
##D vis_dat(airquality, palette = "qual")
##D 
##D # if you have a large dataset, you might want to try downsampling:
##D library(nycflight13)
##D library(dplyr)
##D flights %>%
##D   sample_n(1000) %>%
##D   vis_dat()
##D 
##D flights %>%
##D   slice(1:1000) %>%
##D   vis_dat()
##D 
## End(Not run)




