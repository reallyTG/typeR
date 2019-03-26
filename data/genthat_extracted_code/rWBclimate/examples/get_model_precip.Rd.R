library(rWBclimate)


### Name: get_model_precip
### Title: Download GCM precipitation data
### Aliases: get_model_precip

### ** Examples

## Not run: 
##D # Get data for 2 basins, annual average precipitation for all valid time periods
##D # then subset them, and plot
##D precip_dat <- get_model_precip(c("2","231"),"annualavg",1900,3000)
##D precip_dat <- subset(precip_dat,precip_dat$gcm=="ukmo_hadcm3")
##D precip_dat <- subset(precip_dat,precip_dat$scenario!="b1")
##D ggplot(precip_dat,aes(x=fromYear,y=annualData,group=locator,colour=locator))+geom_path()
##D 
##D ### Get data for 4 countries with monthly precipitation values
##D precip_dat <- get_model_precip(c("USA","BRA","CAN","YEM"),"mavg",2020,2030)
##D precip_dat <- subset(precip_dat,precip_dat$gcm=="ukmo_hadcm3")
##D precip_dat <- subset(precip_dat,precip_dat$scenario!="b1")
##D ggplot(precip_dat,aes(x=as.factor(month),y=monthVals,group=locator,colour=locator))+geom_path()
## End(Not run)



