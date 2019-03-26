library(heatwaveR)


### Name: detect_event
### Title: Detect heatwaves and cold-spells.
### Aliases: detect_event

### ** Examples

res_clim <- ts2clm(sst_WA, climatologyPeriod = c("1983-01-01", "2012-12-31"))
out <- detect_event(res_clim)
# show a portion of the climatology:
out$climatology[1:10, ]
# show some of the heat waves:
out$event[1:5, 1:10]

# Or if one wants to calculate MCSs
res_clim <- ts2clm(sst_WA, climatologyPeriod = c("1983-01-01", "2012-12-31"),
                   pctile = 10)
out <- detect_event(res_clim, coldSpells = TRUE)
# show a portion of the climatology:
out$climatology[1:10, ]
# show some of the cold-spells:
out$event[1:5, 1:10]

# It is also possible to give two separate sets of threshold criteria

# To use a second static threshold we first use the exceedance function
thresh_19 <- exceedance(sst_Med, threshold = 19, minDuration = 10, maxGap = 0)$threshold
# Then we use that output when detecting our events
events_19 <- detect_event(ts2clm(sst_Med, climatologyPeriod = c("1982-01-01", "2011-12-31")),
                         threshClim2 = thresh_19$exceedance, minDuration2 = 10, maxGap2 = 0)

# If we want to use two different percentile thresholds we use detect_event
thresh_95 <- detect_event(ts2clm(sst_Med, pctile = 95,
                                 climatologyPeriod = c("1982-01-01", "2011-12-31")),
                          minDuration = 2, maxGap = 0)$climatology
# Then we use that output when detecting our events
events_95 <- detect_event(ts2clm(sst_Med, climatologyPeriod = c("1982-01-01", "2011-12-31")),
                          threshClim2 = thresh_95$event, minDuration2 = 2, maxGap2 = 0)




