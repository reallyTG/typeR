library(biomod2)


### Name: level.plot
### Title: Plot 2-dimensional data for visualizing distribution of species
###   or environment
### Aliases: level.plot
### Keywords: plot

### ** Examples

## Not run: 
##D # species occurrences
##D DataSpecies <- read.csv(system.file("external/species/mammals_table.csv",
##D                                     package="biomod2"), row.names = 1)
##D 
##D # the name of studied species
##D myRespName <- 'GuloGulo'
##D 
##D # the presence/absences data for our species 
##D myResp <- as.numeric(DataSpecies[,myRespName])
##D 
##D # the XY coordinates of species data
##D myRespXY <- DataSpecies[,c("X_WGS84","Y_WGS84")]
##D 
##D 
##D level.plot(data.in=myResp, XY=myRespXY)
## End(Not run)



