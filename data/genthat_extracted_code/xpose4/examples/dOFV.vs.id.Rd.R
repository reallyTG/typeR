library(xpose4)


### Name: dOFV.vs.id
### Title: Change in Objective function value vs. removal of individuals.
### Aliases: dOFV.vs.id
### Keywords: methods

### ** Examples


## Not run: 
##D library(xpose4)
##D 
##D ## first make sure that the iofv values are read into xpose
##D cur.dir <- getwd()
##D setwd(paste(cur.dir,"/LAG_TIME",sep=""))
##D xpdb1 <- xpose.data(1)
##D setwd(paste(cur.dir,"/TRANSIT_MODEL",sep=""))
##D xpdb2 <- xpose.data(1)
##D setwd(cur.dir)
##D 
##D ## then make the plot
##D dOFV.vs.id(xpdb1,xpdb2)
## End(Not run)




