library(RmarineHeatWaves)


### Name: detect
### Title: Detect heatwaves and cold-spells.
### Aliases: detect

### ** Examples

ts_dat <- make_whole(sst_WA)
res <- detect(ts_dat, climatology_start = "1983-01-01",
              climatology_end = "2012-12-31")
# show a portion of the climatology:
res$clim[1:10, ]
# show some of the heat waves:
res$event[1:5, 1:10]



