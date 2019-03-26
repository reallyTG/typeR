library(rWBclimate)


### Name: get_ensemble_temp
### Title: Download ensemble temperature data
### Aliases: get_ensemble_temp

### ** Examples

## Not run: 
##D # Get data for 2 basins, annual average precipitation for all valid time periods
##D # then subset them, and plot
##D temp_dat <- get_ensemble_temp(c("2","231"),"annualavg",1900,3000)
##D temp_dat <- subset(temp_dat,temp_dat$scenario!="b1")
##D temp_dat$uniqueGroup <- paste(temp_dat$percentile,temp_dat$locator,sep="-")
##D ggplot(temp_dat,aes(x=fromYear,y=annualVal,group=uniqueGroup,colour=as.factor(locator),
##D linetype=as.factor(percentile)))+geom_path()
##D 
##D ### Get data for 2 countries with monthly precipitation values
##D temp_dat <- get_ensemble_temp(c("USA","BRA"),"mavg",2020,2030)
##D temp_dat <- subset(temp_dat,temp_dat$scenario!="b1")
##D temp_dat$uniqueGroup <- paste(temp_dat$percentile,temp_dat$locator,sep="-")
##D ggplot(temp_dat,aes(x=as.factor(month),y=monthVals,group=uniqueGroup,
##D colour=locator))+geom_path()
## End(Not run)



