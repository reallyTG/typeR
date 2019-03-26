library(RmarineHeatWaves)


### Name: event_line
### Title: Create a Line Plot of Marine Heat Waves or Cold Spells.
### Aliases: event_line

### ** Examples

ts_dat <- make_whole(sst_WA)
res <- detect(ts_dat, climatology_start = "1983-01-01",
              climatology_end = "2012-12-31")

## Not run: 
##D event_line(res, spread = 200, metric = "int_cum",
##D start_date = "2010-10-01", end_date = "2011-08-30")
## End(Not run)



