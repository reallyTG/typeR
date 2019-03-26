library(RmarineHeatWaves)


### Name: geom_flame
### Title: Create 'Flame' Ploygons.
### Aliases: geom_flame

### ** Examples

ts_dat <- make_whole(sst_WA)
res <- detect(ts_dat, climatology_start = "1983-01-01",
              climatology_end = "2012-12-31")
mhw <- res$clim
mhw <- mhw[10580:10690,]

## Not run: 
##D require(ggplot2)
##D ggplot(mhw, aes(x = t, y = temp)) +
##D   geom_flame(aes(y2 = thresh_clim_year)) +
##D   geom_text(aes(x = as.Date("2011-02-01"), y = 28,
##D   label = "That's not a heatwave.\nThis, is a heatwave.")) +
##D   xlab("Date") + ylab(expression(paste("Temperature [", degree, "C]")))
## End(Not run)



