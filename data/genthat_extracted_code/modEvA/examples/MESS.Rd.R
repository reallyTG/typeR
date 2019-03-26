library(modEvA)


### Name: MESS
### Title: Multivariate Environmental Similarity Surfaces based on a data
###   frame
### Aliases: MESS

### ** Examples

## Not run: 
##D # load package fuzzySim (currently available on R-Forge) and its sample data:
##D require(fuzzySim)
##D data(rotif.env)
##D 
##D 
##D # add a column specifying the hemisphere:
##D 
##D unique(rotif.env$CONTINENT)
##D 
##D rotif.env$HEMISPHERE <- "Eastern"
##D 
##D rotif.env$HEMISPHERE[rotif.env$CONTINENT %in%
##D c("NORTHERN_AMERICA", "SOUTHERN_AMERICA")] <- "Western"
##D 
##D head(rotif.env)
##D 
##D 
##D # perform a MESS analysis
##D # suppose you'll extrapolate models from the Western hemisphere (Americas)
##D # to the Eastern hemisphere (rest of the world):
##D 
##D names(rotif.env)  # variables are in columns 5:17
##D 
##D west <- subset(rotif.env, HEMISPHERE == "Western", select = 5:17)
##D east <- subset(rotif.env, HEMISPHERE == "Eastern", select = 5:17)
##D east.with.ID <- subset(rotif.env, HEMISPHERE == "Eastern", 
##D select = c(1, 5:17))
##D 
##D head(east)
##D head(east.with.ID)  # ID is in column 1
##D 
##D mess <- MESS(V = west, P = east)
##D mess.with.ID <- MESS(V = west, P = east.with.ID, id.col = 1)
##D 
##D head(mess)
##D head(mess.with.ID)
##D 
##D range(mess[ , "TOTAL"])
## End(Not run)



