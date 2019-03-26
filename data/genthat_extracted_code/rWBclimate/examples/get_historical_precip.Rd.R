library(rWBclimate)


### Name: get_historical_precip
### Title: Download historical precipitation data
### Aliases: get_historical_precip

### ** Examples

## Not run: 
##D ## Plot annual historical data for USA, Brazil and Australia
##D hist_dat <- get_historical_precip(c("USA","BRA","AUS"),"year")
##D ggplot(hist_dat,aes(x = year,y = data, group = locator,
##D colour = locator)) + geom_point() + geom_path() + ylab("Mean annual precipitaion")
##D 
##D ## Plot monthly historical data
##D hist_mo_dat <- get_historical_precip(c("USA","AUS","BRA","IDN"),time_scale="month")
##D ggplot(hist_mo_dat,aes(x = month,y = data, group = locator,
##D colour = locator)) + geom_point() + geom_path() + ylab("Mean monthly precipitaion")
##D 
## End(Not run)



