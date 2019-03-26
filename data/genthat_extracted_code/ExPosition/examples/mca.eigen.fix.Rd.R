library(ExPosition)


### Encoding: UTF-8

### Name: mca.eigen.fix
### Title: mca.eigen.fix
### Aliases: mca.eigen.fix
### Keywords: misc multivariate

### ** Examples

	data(mca.wine)
	#No corrections used in MCA
	mca.wine.res.uncor <- epMCA(mca.wine$data,correction=NULL)
	data <- mca.wine$data
	expo.output <- mca.wine.res.uncor$ExPosition.Data
	#mca.eigen.fix with just Benzécri correction		
	mca.wine.res.b <- mca.eigen.fix(data, expo.output,correction=c('b'))
	#mca.eigen.fix with Benzécri + Greenacre adjustment	
	mca.wine.res.bg <- mca.eigen.fix(data,expo.output,correction=c('b','g'))



