library(openair)


### Name: importTraj
### Title: Import pre-calculated HYSPLIT 96-hour back trajectories
### Aliases: importTraj
### Keywords: methods

### ** Examples



## import trajectory data for London in 2009
## Not run: mytraj <- importTraj(site = "london", year = 2009)

## combine with measurements
## Not run: 
##D theData <- importAURN(site = "kc1", year = 2009)
##D mytraj <- merge(mytraj, theData, by = "date")
## End(Not run)



