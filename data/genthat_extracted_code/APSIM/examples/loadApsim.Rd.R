library(APSIM)


### Name: loadApsim
### Title: Read APSIM .out files.
### Aliases: loadApsim

### ** Examples

## Not run: loadApsim("c:/outputs") # load everything in the outputs directory
## Not run: 
##D loadApsim("c:/outputs/simulation.out", loadAll=FALSE) 
##D # load a single file (note extension is required).
## End(Not run)
## Not run: 
##D loadApsim("c:/outputs", returnFrame=FALSE, fill=TRUE) 
##D   # load everything in the outputs directory, fill any missing columns and return a data table.
## End(Not run)



