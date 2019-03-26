library(geostatsp)


### Name: glgm-methods
### Title: Generalized Linear Geostatistical Models
### Aliases: glgm glgm-methods glgm,ANY,ANY,ANY,ANY-method
###   glgm,formula,Raster,ANY,ANY-method
###   glgm,formula,Spatial,ANY,ANY-method
###   glgm,formula,data.frame,Raster,data.frame-method lgcp

### ** Examples

# use the 'safe' version of INLA on linux systems
if(Sys.info()['sysname'] =='Linux' &
  requireNamespace("INLA", quietly = TRUE)) {   
  INLA::inla.setOption(inla.call = system.file(paste("bin/linux/",          
          ifelse(.Machine$sizeof.pointer == 4, "32", "64"),
          'bit/inla.static', sep=''), package="INLA")) }

# geostatistical model for the swiss rainfall data
require("geostatsp")
data("swissRain")
swissRain$lograin = log(swissRain$rain)
swissFit =  glgm(formula="lograin", data=swissRain, grid=30, 
	covariates=swissAltitude, family="gaussian", buffer=20000,
	prior = list(sd=1, range=100*1000, sdObs = 2),
	control.inla = list(strategy='gaussian')
	)

if(!is.null(swissFit$parameters) ) {
	
	swissExc = excProb(swissFit, threshold=log(25))

	swissExcRE = excProb(swissFit$inla$marginals.random$space, 
		log(1.5),template=swissFit$raster)

	swissFit$parameters$summary

	matplot(
		swissFit$parameters$range$postK[,'x'],
		swissFit$parameters$range$postK[,c('y','prior')],
		type="l", lty=1, xlim = c(0, 1000),
		xlab = 'km', ylab='dens')
	legend('topright', lty=1, col=1:2, legend=c('post','prior'))

	plot(swissFit$raster[["predict.exp"]]) 

	mycol = c("green","yellow","orange","red")
	mybreaks = c(0, 0.2, 0.8, 0.95, 1)
	plot(swissBorder)
	plot(swissExc, breaks=mybreaks, col=mycol,add=TRUE,legend=FALSE)
	plot(swissBorder, add=TRUE)
	legend("topleft",legend=mybreaks, fill=c(NA,mycol))


	plot(swissBorder)
	plot(swissExcRE, breaks=mybreaks, col=mycol,add=TRUE,legend=FALSE)
	plot(swissBorder, add=TRUE)
	legend("topleft",legend=mybreaks, fill=c(NA,mycol))
}

		


# a log-Gaussian Cox process example

myPoints = SpatialPoints(cbind(rbeta(100,2,2), rbeta(100,3,4)))
myPoints@bbox = cbind(c(0,0), c(1,1))

mycov = raster(matrix(rbinom(100, 1, 0.5), 10, 10), 0, 1, 0, 1)
names(mycov)="x1"


res = lgcp(
	formula=~factor(x1),
	data=myPoints, 
	grid=20, covariates=mycov,
	prior=list(sd=c(0.9, 1.1), range=c(0.4, 0.41),
	control.inla = list(strategy='gaussian'))
)
if(requireNamespace("INLA", quietly = TRUE)) {  
	plot(res$raster[["predict.exp"]])
	plot(myPoints,add=TRUE,col="#0000FF30",cex=0.5)
}




