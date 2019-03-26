library(diseasemapping)


### Name: diseasemapping-package
### Title: Disease Mapping
### Aliases: diseasemapping-package diseasemapping

### ** Examples

# creating SMR's
data('kentucky')

if(FALSE) {
	# must have an internet connection to do the following
	larynxRates= cancerRates("USA", year=1998:2002,site="Larynx")
	# get rid of under 10's
	larynxRates = larynxRates[-grep("_(0|5)$",names(larynxRates))]
	dput(larynxRates)
} else {
larynxRates = structure(c(0, 0, 0, 0, 1e-06, 6e-06, 2.3e-05, 4.5e-05, 9.9e-05, 
0.000163, 0.000243, 0.000299, 0.000343, 0.000308, 0.000291, 0.000217, 
0,0, 0, 0, 1e-06, 1e-06, 3e-06, 8e-06, 1.3e-05, 2.3e-05, 3.5e-05, 
5.8e-05, 6.8e-05, 7.5e-05, 5.5e-05, 4.1e-05, 3e-05), .Names = c("M_10", 
"M_15", "M_20", "M_25", "M_30", "M_35", "M_40", "M_45", "M_50", 
"M_55", "M_60", "M_65", "M_70", "M_75", "M_80", "M_85", "F_0", "F_10", 
"F_15", "F_20", "F_25", "F_30", "F_35", "F_40", "F_45", "F_50", 
"F_55", "F_60", "F_65", "F_70", "F_75", "F_80", "F_85"))

}

kentucky2 = getSMR(kentucky, larynxRates, larynx, 
		regionCode="County")

if(require('mapmisc', quietly=TRUE)) {
	mycol = colourScale(kentucky2$SMR, breaks=9, 
	dec=-log10(0.5), style='equal', transform='sqrt')
	plot(kentucky2, col=mycol$plot)
	legendBreaks('topleft', mycol)
}

if( require("spdep", quietly=TRUE) & require("INLA", quietly=TRUE)) {


kBYM = bym(observed ~ offset(logExpected) + poverty, kentucky2, 
	 priorCI = list(sdSpatial=c(0.1, 5), sdIndep=c(0.1, 5)),
	 control.mode=list(theta=c(3.52, 3.35),restart=TRUE))

kBYM$par$summary

}

# an example of a spatial model with glmmBUGS

## Not run: 
##D # run the model
##D library('spdep')
##D popDataAdjMat = poly2nb(ontario,row.names=as.character(ontario[["CSDUID"]]))
##D 
##D library('glmmBUGS')
##D forBugs = glmmBUGS(formula=observed + logExpected ~ 1,
##D   effects="CSDUID", family="poisson", spatial=popDataAdjMat,
##D   data=ontario@data)
##D startingValues = forBugs$startingValues
##D source("getInits.R")
##D library('R2WinBUGS')
##D ontarioResult = bugs(forBugs$ragged, getInits, parameters.to.save = names(getInits()),
##D     model.file="model.bug", n.chain=3, n.iter=100, n.burnin=10, n.thin=2,
##D       program="winbugs", debug=TRUE)
##D 
##D ontarioParams = restoreParams(ontarioResult, forBugs$ragged)
##D ontarioSummary = summaryChain(ontarioParams)
##D 
##D # merge results back in to popdata
##D ontario = mergeBugsData(ontario, ontarioSummary)
## End(Not run)


# running the same thing with INLA
## Not run: 
##D library('INLA')
##D # get rid of regions with no neighbours
##D ontario2 = ontario[! as.character(ontario$CSDUID) ##D 
##D c("3510005" ,"3501007", "3537001", "3551031", "3560065", "3560062"),]
##D popDataAdjMat2 = poly2nb(ontario2,
##D 	row.names=as.character(ontario2[["CSDUID"]]))
##D nb2INLA("nb.graph",popDataAdjMat2)
##D 
##D ontario2$CSDUID = as.character(ontario2$CSDUID)
##D  
##D prior.iid=prior.besag=c(.42,.00015)
##D formula.bym = observed ~  f(CSDUID, 
##D     model = "bym", graph = "nb.graph", values=CSDUID ,
##D     param = c(prior.iid, prior.besag))
##D  
##D result1.bym = inla(formula.bym,family="poisson",data=ontario2@data,
##D 	offset=ontario2@data$logExpected,
##D     verbose=FALSE, keep = TRUE, 
##D     control.predictor=list(compute=TRUE))
##D     
##D 
##D tomerge = result1.bym$summary.random$CSDUID
##D rownames(tomerge) = tomerge$ID
##D  
##D ontario2@data =   cbind(ontario2@data, 
##D 	tomerge[as.character(ontario2$CSDUID),] )   
##D 	
##D require('mapmisc') 
##D mycol = colourScale(ontario2$mean, breaks=9, 
##D 	dec=1, style='equal', transform='sqrt')
##D plot(ontario2, col=mycol$plot)
##D legendBreaks('topleft', mycol)
##D 	
## End(Not run)




