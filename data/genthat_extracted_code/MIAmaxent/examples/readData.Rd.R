library(MIAmaxent)


### Name: readData
### Title: Read in data object from files.
### Aliases: readData

### ** Examples

toydata_sp1po <- readData(system.file("extdata/sommerfeltia", "Sp1.csv", package = "MIAmaxent"),
   contEV = system.file("extdata/sommerfeltia", "EV_continuous", package = "MIAmaxent"))
toydata_sp1po

## Not run: 
##D # From vignette:
##D grasslandPO <- readData(
##D  occurrence=system.file("extdata", "occurrence_PO.csv", package="MIAmaxent"),
##D   contEV=system.file("extdata", "EV_continuous", package="MIAmaxent"),
##D   catEV=system.file("extdata", "EV_categorical", package="MIAmaxent"),
##D   maxbkg=20000)
##D str(grasslandPO)
##D 
##D # From vignette:
##D grasslandPA <- readData(
##D   occurrence = system.file("extdata", "occurrence_PA.csv", package="MIAmaxent"),
##D   contEV = system.file("extdata", "EV_continuous", package="MIAmaxent"),
##D   catEV = system.file("extdata", "EV_categorical", package="MIAmaxent"),
##D   PA = TRUE, XY = TRUE)
##D head(grasslandPA)
##D tail(grasslandPA)
## End(Not run)




