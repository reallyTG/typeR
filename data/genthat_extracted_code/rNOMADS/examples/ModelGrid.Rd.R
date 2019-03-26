library(rNOMADS)


### Name: ModelGrid
### Title: Transform model data into an array
### Aliases: ModelGrid
### Keywords: manip

### ** Examples

## Not run: 
##D #Get some example data 
##D urls.out <- CrawlModels(abbrev = "gfs_0p50", depth = 1)
##D model.parameters <- ParseModelPage(urls.out[1])
##D levels <- c("2 m above ground", "100 mb")
##D variables <- c("TMP", "RH") #Temperature and relative humidity
##D grib.info <- GribGrab(urls.out[1], model.parameters$pred[1], levels, variables)
##D #Extract the data
##D model.data <- ReadGrib(grib.info[[1]]$file.name, levels, variables)
##D 
##D #Make it into an array
##D gfs.array <- ModelGrid(model.data, c(0.5, 0.5))
##D 
##D #What variables and levels we have
##D print(gfs.array$levels)
##D print(gfs.array$variables)
##D 
##D #Find minimum temperature at the ground surface, and where it is
##D min.temp <- min(gfs.array$z[2, 1,,] - 273.15)
##D sprintf("%.1f", min.temp) #in Celsius 
##D 
##D ti <- which(gfs.array$z[2, 1,,] == min.temp + 273.15, arr.ind = TRUE)
##D 
##D lat <- gfs.array$y[ti[1,2]] #Lat of minimum temp
##D lon <- gfs.array$x[ti[1,1]] #Lon of minimum temp
##D 
##D #Find maximum temperature at 100 mb atmospheric pressure
##D max.temp <- max(gfs.array$z[1, 1,,]) - 273.15
##D sprintf("%.1f", max.temp) #Brrr!
## End(Not run)



