library(rWBclimate)


### Name: get_historical_temp
### Title: Download historical temperature data
### Aliases: get_historical_temp

### ** Examples

## Not run: 
##D ## Plot annual historical data for USA, Brazil and Australia
##D hist_dat <- get_historical_precip(c("USA","BRA","AUS"),"year")
##D ggplot(hist_dat,aes(x = year,y = data, group = locator,
##D colour = locator)) + geom_point() + geom_path() + ylab("Mean annual temperature")
##D 
##D ## Plot monthly historical data
##D hist_mo_dat <- get_historical_precip(c("USA","AUS","BRA","IDN"),time_scale="month")
##D ggplot(hist_mo_dat,aes(x = month,y = data, group = locator,
##D colour = locator)) + geom_point() + geom_path() + ylab("Mean monthly temperature")
##D 
## End(Not run)



