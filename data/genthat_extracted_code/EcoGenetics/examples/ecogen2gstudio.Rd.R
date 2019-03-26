library(EcoGenetics)


### Name: ecogen2gstudio
### Title: Conversion from ecogen to gstudio and gstudio to ecogen
### Aliases: ecogen2gstudio gstudio2ecogen

### ** Examples


## Not run: 
##D 
##D data(eco.test)
##D togstudio <- ecogen2gstudio(eco, type = "codominant")
##D togstudio
##D toeco <- gstudio2ecogen(togstudio, ID = "ID", lat = "Latitude", 
##D lon = "Longitude", struct = "pop")
##D toeco
##D # as ID, Latitude and Longitude are column names in the <togstudio> data frame 
##D # (that match default parameter values for gstudio2ecogen), 
##D # the latter is identical to this:
##D toeco <- gstudio2ecogen(togstudio, struct = "pop")
##D toeco
## End(Not run)




