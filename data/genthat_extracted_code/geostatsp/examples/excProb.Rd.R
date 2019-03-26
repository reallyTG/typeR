library(geostatsp)


### Name: excProb
### Title: Exceedance probabilities
### Aliases: excProb

### ** Examples

	data('swissRain')
	swissFit =  lgm("rain", swissRain, grid=30, 
	boxcox=0.5,fixBoxcox=TRUE,	covariates=swissAltitude)
	swissExc = excProb(swissFit, 20)
	mycol = c("green","yellow","orange","red")
	mybreaks = c(0, 0.2, 0.8, 0.9, 1)
	plot(swissBorder)
	plot(swissExc, breaks=mybreaks, col=mycol,add=TRUE,legend=FALSE)
	plot(swissBorder, add=TRUE)
	legend("topleft",legend=mybreaks, col=c(NA,mycol))
## Not run: 
##D 	swissRain$sqrtrain = sqrt(swissRain$rain)
##D 	swissFit2 =  glgm(formula="sqrtrain",data=swissRain, grid=40, 
##D 	covariates=swissAltitude,family="gaussian")
##D 	swissExc = excProb(swissFit2, threshold=sqrt(30))
##D 	swissExc = excProb(swissFit2$inla$marginals.random$space, 0,
##D 		template=swissFit2$raster)
## End(Not run)




