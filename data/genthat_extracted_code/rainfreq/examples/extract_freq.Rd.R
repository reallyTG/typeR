library(rainfreq)


### Name: extract_freq
### Title: Extract rainfall frequency estimates for desired region of the
###   USA
### Aliases: extract_freq

### ** Examples

## Not run: 
##D # southeast, 100yr-24hour storm
##D x_se <- extract_freq()
##D class(x_se)
##D print(x_se)
##D # midwest, 1000yr-48hour storm
##D x_mw <- extract_freq(region_name = "mw", storm_RP = 1000, storm_duration = "48h")
##D print(y_se)
##D # download only, southeast, 100yr-24hour storm
##D extract_freq(flag_down_read = FALSE, flag_down_only = TRUE)
##D # read after download, southeast, 100yr-24hour storm
##D x_se <- extract_freq(flag_down_read = FALSE, flag_read_only = TRUE)
##D print(x_se)
## End(Not run)
# record rainfall for the usa
data(rain_max_usa)
head(rain_max_usa)
# record rainfall for the world
data(rain_max_world)
head(rain_max_world)



