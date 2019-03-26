library(glmmBUGS)


### Name: addSpatial
### Title: Calculate adjacency values for WinBUGS
### Aliases: addSpatial

### ** Examples


## Not run: 
##D 
##D # get a winbugs model and data ready, without a spatial effect
##D data(ontario)
##D 
##D forBugs = glmmBUGS(formula=observed + logExpected ~ 1,
##D   effects="CSDUID",   family="poisson",
##D   data=data.frame(ontario))
##D 
##D # now add a spatial effect.  
##D # first, compute the adjacency matrix 
##D # if region ID's are stored as factors, make sure to convert
##D # them to characters rather than the default of converting them
##D # to integers
##D library(diseasemapping)
##D data(popdata)
##D popDataAdjMat = poly2nb(popdata,row.names=as.character(popdata[["CSDUID"]]) )
##D 
##D data(popDataAdjMat)
##D 
##D # add the adjacency matrix to the ragged array  
##D raggedWithSpatial = addSpatial(popDataAdjMat, forBugs$ragged, "CSDUID")
##D 
##D # write a new bugs model with a spatial effect
##D writeBugsModel("model.bug", "CSDUID", NULL, c("count", "expected"), 
##D "poisson", spatial="CSDUID")
##D startingValues = forBugs$startingValues
##D source("getInits.R")
##D 
##D library(R2WinBUGS)
##D popResult = bugs(raggedWithSpatial, getInits, 
##D parameters.to.save = names(getInits()), model.file="model.bug", 
##D n.chain=3, n.iter=1000, n.burnin=100, n.thin=10, program="winbugs")   
## End(Not run)



