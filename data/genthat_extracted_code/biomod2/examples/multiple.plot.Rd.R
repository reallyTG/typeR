library(biomod2)


### Name: multiple.plot
### Title: Plot and compare prediction maps within BIOMOD
### Aliases: multiple.plot
### Keywords: plot

### ** Examples

## Not run: 
##D # species occurrences
##D DataSpecies <- read.csv(system.file("external/species/mammals_table.csv",
##D                                     package="biomod2"), row.names = 1)
##D 
##D # the name of studied species
##D myRespName <- c("ConnochaetesGnou", "GuloGulo", "PantheraOnca", 
##D                 "PteropusGiganteus", "TenrecEcaudatus", "VulpesVulpes")
##D 
##D # the presence/absences data for our species 
##D myResp <- DataSpecies[,myRespName]
##D 
##D # the XY coordinates of species data
##D myRespXY <- DataSpecies[,c("X_WGS84","Y_WGS84")]
##D 
##D multiple.plot(Data = myResp,
##D               coor = myRespCoord )
## End(Not run)



