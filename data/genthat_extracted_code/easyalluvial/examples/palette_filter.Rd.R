library(easyalluvial)


### Name: palette_filter
### Title: color filters for any vector of hex color values
### Aliases: palette_filter

### ** Examples


require(magrittr)

palette_qualitative() %>%
  palette_filter(thresh_similar = 0) %>%
  palette_plot_intensity()

## Not run: 
##D # more examples---------------------------
##D 
##D palette_qualitative() %>%
##D   palette_filter(thresh_similar = 25) %>%
##D   palette_plot_intensity()
##D 
##D palette_qualitative() %>%
##D   palette_filter(thresh_similar = 0, blues = FALSE) %>%
##D   palette_plot_intensity()
## End(Not run)



