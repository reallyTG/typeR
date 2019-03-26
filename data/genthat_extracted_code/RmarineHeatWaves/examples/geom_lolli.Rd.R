library(RmarineHeatWaves)


### Name: geom_lolli
### Title: Visualise a Timeline of Several Event Metrics as 'Lollipops'.
### Aliases: geom_lolli

### ** Examples

ts_dat <- make_whole(sst_NW_Atl)
# with defaults:
res <- detect(ts_dat, climatology_start = "1983-01-01",
              climatology_end = "2012-12-31")
mhw <- res$event

## Not run: 
##D require(lubridate)
##D # Height of lollis represent event durations and their colours
##D # are mapped to the events' cumulative intensity:
##D ggplot(mhw, aes(x = mhw$date_peak, y = mhw$duration)) +
##D   geom_lolli(n = 0, shape = 20, aes(colour = mhw$int_cum), colour.n = NA) +
##D   scale_color_distiller(palette = "Spectral", name = "Cumulative \nintensity") +
##D   xlab("Date") + ylab("Event duration [days]")
##D 
##D # Height of lollis represent event durations and the top three (longest)
##D # lollis are highlighted in red:
##D ggplot(mhw, aes(x = mhw$date_peak, y = mhw$duration)) +
##D   geom_lolli(n = 3, shape = 20, colour.n = "red") +
##D   scale_color_distiller(palette = "Spectral", name = "Cumulative \nintensity") +
##D   xlab("Date") + ylab("Event duration [days]")
## End(Not run)



