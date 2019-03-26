library(RmarineHeatWaves)


### Name: lolli_plot
### Title: Create a Timeline of Selected Event Metrics.
### Aliases: lolli_plot

### ** Examples

ts_dat <- make_whole(sst_NW_Atl)
res <- detect(ts_dat, climatology_start = "1983-01-01",
              climatology_end = "2012-12-31")

## Not run: 
##D lolli_plot(res, metric = "int_cum", event_count = 3, xaxis = "date_peak")
## End(Not run)



