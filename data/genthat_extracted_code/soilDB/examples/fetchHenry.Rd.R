library(soilDB)


### Name: fetchHenry
### Title: Download Data from the Henry Mount Soil Temperature and Water
###   Database
### Aliases: fetchHenry month2season summarizeSoilTemperature
### Keywords: manip

### ** Examples

## Not run: 
##D library(lattice)
##D 
##D # get CA630 data as daily averages
##D x <- fetchHenry(project='CA630', gran = 'day')
##D 
##D # inspect data gaps
##D levelplot(factor(!is.na(sensor_value)) ~ doy * factor(year) | name, 
##D data=x$soiltemp, col.regions=c('grey', 'RoyalBlue'), cuts=1, 
##D colorkey=FALSE, as.table=TRUE, scales=list(alternating=3), 
##D par.strip.text=list(cex=0.75), strip=strip.custom(bg='yellow'), 
##D xlab='Julian Day', ylab='Year')
## End(Not run)



