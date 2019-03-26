library(rWBclimate)


### Name: get_ensemble_stats
### Title: Download ensemble statistics
### Aliases: get_ensemble_stats

### ** Examples

## Not run: 
##D  ### Request data on the US for days of rain over 2 mm
##D  ens_dat <- get_ensemble_stats("USA","mavg","ppt_days2")
##D  # subset to the 50th percentile and just until the year 2100
##D  ens_dat <- subset(ens_dat, ens_dat$percentile == 50)
##D  ens_dat <- subset(ens_dat,ens_dat$toYear == 2100)
##D  ggplot(ens_dat,aes(x = as.factor(month), y= monthVals, group=scenario,
##D  colour=scenario)) + geom_point() + geom_line()
## End(Not run)



