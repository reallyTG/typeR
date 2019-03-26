library(diseasemapping)


### Name: bym-methods
### Title: Fit the BYM model
### Aliases: bym bym-methods bym,formula,ANY,ANY,missing-method
###   bym,formula,ANY,missing,missing-method
###   bym,formula,SpatialPolygonsDataFrame,NULL,character-method
###   bym,formula,SpatialPolygonsDataFrame,missing,character-method
###   bym,formula,SpatialPolygonsDataFrame,nb,character-method
###   bym,formula,data.frame,nb,character-method
### Keywords: Bayesian inference disease mapping

### ** Examples


data('kentucky')

# must have an internet connection to do the following
## Not run: 
##D 	larynxRates= cancerRates("USA", year=1998:2002,site="Larynx")
##D 	dput(larynxRates)
## End(Not run)

larynxRates = structure(c(0, 0, 0, 0, 0, 0, 1e-06, 6e-06, 2.3e-05, 4.5e-05, 
9.9e-05, 0.000163, 0.000243, 0.000299, 0.000343, 0.000308, 0.000291, 
0.000217, 0, 0, 0, 0, 0, 1e-06, 1e-06, 3e-06, 8e-06, 1.3e-05, 
2.3e-05, 3.5e-05, 5.8e-05, 6.8e-05, 7.5e-05, 5.5e-05, 4.1e-05, 
3e-05), .Names = c("M_0", "M_5", "M_10", "M_15", "M_20", "M_25", 
"M_30", "M_35", "M_40", "M_45", "M_50", "M_55", "M_60", "M_65", 
"M_70", "M_75", "M_80", "M_85", "F_0", "F_5", "F_10", "F_15", 
"F_20", "F_25", "F_30", "F_35", "F_40", "F_45", "F_50", "F_55", 
"F_60", "F_65", "F_70", "F_75", "F_80", "F_85"), 
site = "Larynx", area = "USA, SEER", year = "1998-2002")

# get rid of under 10's
larynxRates = larynxRates[-grep("_(0|5)$",names(larynxRates))]

kentucky = getSMR(kentucky, larynxRates, larynx, regionCode="County")

if( require("spdep", quietly=TRUE)) {

kBYM = bym(observed ~ offset(logExpected) + poverty, kentucky, 
	 priorCI = list(sdSpatial=c(0.1, 5), sdIndep=c(0.1, 5)),
	 control.mode=list(theta=c(3.52, 3.35),restart=TRUE))

	kBYM$par$summary
	
	if(requireNamespace('geostatsp', quietly=TRUE))
		kBYM$data$exc1 = geostatsp::excProb(
			kBYM$inla$marginals.fitted.bym, log(1.2)
			)
}  else {
	kBYM = list()
}




if(require('mapmisc', quietly=TRUE) & length(kBYM$data$fitted.exp)){

thecol = colourScale(kBYM$data$fitted.exp, 
	breaks=5, dec=1, opacity = 0.7)

map.new(kBYM$data)

## Not run: 
##D kmap = openmap(kBYM$data)
##D plot(kmap,add=TRUE)
## End(Not run)

plot(kBYM$data, col=thecol$plot,add=TRUE)
legendBreaks("topleft", thecol)

}




