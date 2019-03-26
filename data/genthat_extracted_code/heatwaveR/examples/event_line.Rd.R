library(heatwaveR)


### Name: event_line
### Title: Create a line plot of heatwaves or cold-spells.
### Aliases: event_line

### ** Examples

ts <- ts2clm(sst_WA, climatologyPeriod = c("1983-01-01", "2012-12-31"))
res <- detect_event(ts)

event_line(res, spread = 100, metric = "intensity_cumulative",
start_date = "2010-12-01", end_date = "2011-06-30")

event_line(res, spread = 100, start_date = "2010-12-01",
end_date = "2011-06-30", category = TRUE)




