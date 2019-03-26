library(RmarineHeatWaves)


### Name: block_average
### Title: Calculate Yearly Means for Event Metrics.
### Aliases: block_average

### ** Examples

# ts_dat <- make_whole(sst_Med)
# res <- detect(ts_dat, climatology_start = "1983-01-01",
#               climatology_end = "2012-12-31")
# out <- block_average(res)
# summary(glm(count ~ year, out, family = "poisson"))

## Not run: 
##D plot(out$year, out$count, col = "salmon", pch = 16,
##D      xlab = "Year", ylab = "Number of events")
##D lines(out$year, out$count)
## End(Not run)



