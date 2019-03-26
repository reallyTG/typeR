library(rWBclimate)


### Name: get_model_temp
### Title: Download GCM temperature data
### Aliases: get_model_temp

### ** Examples

## Not run: 
##D # Get data for 2 basins, annual average temperature for all valid time periods
##D # then subset them, and plot
##D temp_dat <- get_model_temp(c("2","231"),"annualavg",1900,3000)
##D temp_dat <- subset(temp_dat,temp_dat$gcm=="ukmo_hadcm3")
##D temp_dat <- subset(temp_dat,temp_dat$scenario!="b1")
##D ggplot(temp_dat,aes(x=fromYear,y=data,group=locator,
##D colour=locator))+geom_path()
##D 
##D ### Get data for 4 countries with monthly tempitation values
##D temp_dat <- get_model_temp(c("USA","BRA","CAN","YEM"),"mavg",2020,2030)
##D temp_dat <- subset(temp_dat,temp_dat$gcm=="ukmo_hadcm3")
##D temp_dat <- subset(temp_dat,temp_dat$scenario!="b1")
##D ggplot(temp_dat,aes(x=as.factor(month),y=data,group=locator,
##D colour=locator))+geom_path()
## End(Not run)



