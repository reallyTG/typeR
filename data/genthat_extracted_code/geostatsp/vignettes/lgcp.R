## ----knitr, include=FALSE, tidy=FALSE------------------------------------
knitr::opts_chunk$set(out.width='0.48\\textwidth', 
	fig.align='default', fig.height=3, fig.width=6,
	tidy = FALSE)
if(Sys.info()['sysname'] =='Linux' & requireNamespace("INLA")) {   
	INLA::inla.setOption(inla.call = 
		system.file(paste("bin/linux/",          
			ifelse(.Machine$sizeof.pointer == 4, "32", "64"),
			'bit/inla.static', sep=''),
		package="INLA")) 
}

## ----packages------------------------------------------------------------
library('mapmisc')
library("geostatsp")
data('murder')
data('torontoPop')

## ----Covariates, tidy=FALSE----------------------------------------------
if(requireNamespace("rgdal") & requireNamespace("rgeos")) {
	murderT = spTransform(murder, omerc(murder, angle=-20))
	borderT = spTransform(torontoBorder, projection(murderT))
	borderC = crop(borderT, extent(-12700, 7000, -7500, 3100))
}

covList = list(
		pop=torontoPdens,
		inc = log(torontoIncome) )

formulaHere = ~ inc + offset(pop, log=TRUE)

## ----lgcpGamma, tidy=FALSE-----------------------------------------------
if(requireNamespace("rgdal") & requireNamespace("rgeos") & requireNamespace("INLA")) {
	resG=lgcp(
		formula = formulaHere, 
		data=murderT, 
			grid=squareRaster(borderC, 30),
			covariates=covList,
			border=borderC, buffer=2000,
			prior = list(
				sd = c(lower = 0.2, upper = 2), 
				range = c(lower = 2, upper=20)*1000),
			control.inla=list(strategy='gaussian')
	)
} else {
	resG = NULL
}

## ----lgcpPc, tidy=FALSE--------------------------------------------------
if(requireNamespace("rgdal") & requireNamespace("rgeos") & requireNamespace("INLA")) {
	resP=lgcp(formulaHere, data=murderT, 
			grid=squareRaster(borderC, 30),
			covariates=covList,
			border=borderC, buffer=2000,
			prior = list(
				sd = c(u=0.5, alpha=0.05), 
				range = c(u=10*1000, alpha = 0.4)),
			control.inla = list(strategy='gaussian')
	) 
} else {
	resP = NULL
}

## ----lgcpTable, tidy=FALSE-----------------------------------------------
sdSeq = seq(0,4,len=501)
rangeSeq = seq(0,15*1000, len=501)
if(requireNamespace("rgdal") & requireNamespace("rgeos") & requireNamespace("INLA")) {
	resT=lgcp(formulaHere, 
			data=murderT, 
			grid=squareRaster(borderC, 30),
			covariates=covList,
			border=borderC, buffer=2000,
			prior = list(
					sd = cbind(sdSeq, dexp(sdSeq, 2)), 
					range = cbind(rangeSeq, dexp(rangeSeq, 1/5000))),
			control.inla = list(strategy='gaussian')
	)
} else {
	resT = NULL
}

## ----summary-------------------------------------------------------------
if(!is.null(resG$parameters))
	knitr::kable(resG$parameters$summary[,c(1,3,5)], digits=3)

## ----summaryPc-----------------------------------------------------------
if(!is.null(resP$parameters))
	knitr::kable(resP$parameters$summary[,c(1,3,5)], digits=3)

## ----summaryT------------------------------------------------------------
if(!is.null(resT$parameters))
	knitr::kable(resT$parameters$summary[,c(1,3,5)], digits=3)

## ----priorPost, fig.cap="Priors and posteriors", fig.height=4, fig.width=3, fig.subcap=c("sd", "range"), echo=FALSE----

if(!is.null(resG$parameters)) {
	
	matplot(resG$parameters$sd$posterior[,'x'], 
			resG$parameters$sd$posterior[,c('y', 'prior')],
			type='l', lty=1:2,
			col='red', 
			xlab='sd', ylab='dens')
	matlines(resP$parameters$sd$posterior[,'x'], 
			resP$parameters$sd$posterior[,c('y', 'prior')],
			lty=1:2, col='blue' )
	matlines(resT$parameters$sd$posterior[,'x'], 
			resT$parameters$sd$posterior[,c('y', 'prior')],
			lty=1:2, col='green' )

	legend('topleft', lty=c(1,1,1,1,2), 
			col=c('red','blue', 'green','black','black'), 
			legend=c( 'Gamma','PC','table', 'posterior','prior'))


	matplot(resG$parameters$range$posterior[,'x'], 
			resG$parameters$range$posterior[,c('y', 'prior')],
			type='l', lty=1:2,
			col='red', 
			xlab='range', ylab='dens')
	matlines(resP$parameters$range$posterior[,'x'], 
			resP$parameters$range$posterior[,c('y', 'prior')],
			lty=1:2, col='blue' )
	matlines(resT$parameters$range$posterior[,'x'], 
			resT$parameters$range$posterior[,c('y', 'prior')],
			lty=1:2, col='green' )

	legend('topleft', lty=c(1,1,1,1,2), 
			col=c('red','blue', 'green','black','black'), 
			legend=c( 'Gamma','PC','table', 'posterior','prior'))
	
} else {
	plot(1:10)
	plot(1:10)
}

## ----maps, fig.cap='Random effects and fitted values', fig.subcap=c('gamma, fitted','pc fitted','gamma random','pc random'), echo=FALSE----

if(require('mapmisc', quietly=TRUE) & !is.null(resG$raster)) {
	
	thecex=1.2	
	
	colFit = colourScale(resG$raster[['predict.exp']],
			breaks=6, dec=8, style='equal',
			transform='log')
	
	
	map.new(resG$raster, TRUE)
	plot(resG$raster[['predict.exp']], 
			col=colFit$col,breaks=colFit$breaks,
			legend=FALSE, add=TRUE)
	points(murderT, col='#00FF0050',cex=0.2)
	legendBreaks('bottomright', colFit, cex=thecex)
	
	
	map.new(resG$raster, TRUE)
	plot(resP$raster[['predict.exp']], 
			col=colFit$col,breaks=colFit$breaks,
			legend=FALSE, add=TRUE)
	points(murderT, col='#00FFFF50',cex=0.2)
	legendBreaks('bottomright', colFit, cex=thecex)
	
	
	colR = colourScale(resG$raster[['random.mean']],
			breaks=12, dec=0, style='equal')
	
	map.new(resG$raster, TRUE)
	plot(resG$raster[['random.mean']], 
			col=colR$col,breaks=colR$breaks,
			legend=FALSE, add=TRUE)
	legendBreaks('bottomright', colR, cex=thecex)
	
	map.new(resG$raster, TRUE)
	plot(resP$raster[['random.mean']], 
			col=colR$col,breaks=colR$breaks,
			legend=FALSE, add=TRUE)
	legendBreaks('bottomright', colR, cex=thecex)
	
	
} else {
	plot(1:10)
	plot(1:10)
	plot(1:10)
	plot(1:10)
	
}

