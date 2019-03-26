library(rWBclimate)


### Name: get_ensemble_precip
### Title: Download ensemble precipitation data
### Aliases: get_ensemble_precip

### ** Examples

## Not run: 
##D # Get data for 2 basins, annual average precipitation for all valid time periods
##D # then subset them, and plot
##D precip_dat <- get_ensemble_precip(c("2","231"),"annualavg",1900,3000)
##D precip_dat <- subset(precip_dat,precip_dat$scenario!="b1")
##D precip_dat$uniqueGroup <- paste(precip_dat$percentile,precip_dat$locator,sep="-")
##D ggplot(precip_dat,aes(x=fromYear,y=annualVal,group=uniqueGroup,colour=as.factor(locator),
##D linetype=as.factor(percentile)))+ geom_path()
##D 
##D ### Get data for 2 countries with monthly precipitation values
##D precip_dat <- get_ensemble_precip(c("USA","BRA"),"mavg",2020,2030)
##D precip_dat <- subset(precip_dat,precip_dat$scenario!="b1")
##D precip_dat$uniqueGroup <- paste(precip_dat$percentile,precip_dat$locator,sep="-")
##D ggplot(precip_dat,aes(x=as.factor(month),y=monthVals,group=uniqueGroup,
##D colour=locator))+geom_path()
## End(Not run)



