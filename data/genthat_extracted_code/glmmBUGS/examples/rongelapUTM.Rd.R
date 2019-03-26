library(glmmBUGS)


### Name: rongelapUTM
### Title: Rongelap island data
### Aliases: rongelapUTM rongelapResult
### Keywords: datasets

### ** Examples

data("rongelapUTM")
if(require("sp", quietly=TRUE)){
	plot(rongelapUTM)
}

## Not run: 
##D rongelapBorderLL = raster::getData("GADM", 
##D country="MHL",level=0) 
##D library("rgdal")
##D rongelapBorderUTM = spTransform(rongelapBorderLL, 
##D 	CRS(proj4string(rongelapUTM)))
##D plot(rongelapBorderUTM, add=TRUE)
## End(Not run)

rongelapUTM$logOffset = log(rongelapUTM$time)
rongelapUTM$site = seq(1, length(rongelapUTM$time)) 
  
forBugs = glmmBUGS(
formula=count + logOffset ~ 1, family="poisson",
    data=rongelapUTM@data, effects="site", 
    spatial=rongelapUTM,
    priors=list(phisite="dgamma(100,1)")
    )

startingValues = forBugs$startingValues
startingValues$phi=list(site = 100)

source("getInits.R")

## Not run: 
##D rongelapResult = bugs(forBugs$ragged, getInits, 
##D   parameters.to.save = names(getInits()),
##D     model.file="model.bug", n.chain=2, n.iter=20, n.burnin=4, n.thin=2,
##D       program="winbugs", debug=TRUE,
##D       working.directory=getwd())
##D rongelapParams = restoreParams(rongelapResult, forBugs$ragged)
## End(Not run)

data("rongelapResult")
rongelapParams = restoreParams(rongelapResult)


checkChain(rongelapParams)

rongelapSummary=summaryChain(rongelapParams)



