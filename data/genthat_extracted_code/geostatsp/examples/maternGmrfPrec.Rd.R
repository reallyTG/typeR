library(geostatsp)


### Name: maternGmrfPrec
### Title: Precision matrix for a Matern spatial correlation
### Aliases: maternGmrfPrec maternGmrfPrec.default maternGmrfPrec.dgCMatrix
###   NNmat NNmat.default NNmat.Raster

### ** Examples

# produces the matrix above
	matrix(NNmat(11, 11, nearest=5)[,11*5+6],11, 11)

	params=c(range = 3,	shape=2, variance=5^2)
	
	myGrid = squareRaster(extent(0,20,0,10), 40)
		
	# precision matrix without adjusting for edge effects
	precMat =maternGmrfPrec(N=myGrid, param=params) 
	
	attributes(precMat)$info$precisionEntries
	
	midcell = cellFromRowCol(myGrid, 
		round(nrow(myGrid)/2), round(ncol(myGrid)/2)) # the middle cell
	edgeCell = cellFromRowCol(myGrid, 5,5)# cell near corner

# show precision of middle cell 
	precMid=matrix(precMat[,midcell], 
		nrow(myGrid), ncol(myGrid), byrow=TRUE)

	precMid[round(nrow(precMid)/2) + seq(-5, 5), 
		round(ncol(precMid)/2) + seq(-3, 3)]

	# and with the adjustment
	precMatCorr =maternGmrfPrec(
		N = myGrid, param=params, 
		adjustEdges=TRUE) 

if(interactive() | Sys.info()['user'] =='patrick') {	

# variance matrices
	varMat = Matrix::solve(precMat)
	varMatCorr = Matrix::solve(precMatCorr)

# compare covariance matrix to the matern
	xseq = seq(-ymax(myGrid), ymax(myGrid), len=1000)/1.5
	plot(xseq, matern(xseq, param=params),
	 type = 'l',ylab='cov', xlab='dist',
	 ylim=c(0, params["variance"]*1.1),
	 main="matern v gmrf")

	# middle cell
	varMid=matrix(varMat[,midcell], 
		nrow(myGrid), ncol(myGrid), byrow=TRUE)
	varMidCorr=matrix(varMatCorr[,midcell], 
		nrow(myGrid), ncol(myGrid), byrow=TRUE)
	xseqMid = yFromRow(myGrid) - yFromCell(myGrid, midcell)	
	points(xseqMid, varMid[,colFromCell(myGrid, midcell)], 
		col='red')
	points(xseqMid, varMidCorr[,colFromCell(myGrid, midcell)],
		 col='blue', cex=0.5)

	# edge cells
	varEdge=matrix(varMat[,edgeCell], 
	  nrow(myGrid), ncol(myGrid), byrow=TRUE)
	varEdgeCorr = matrix(varMatCorr[,edgeCell], 
	  nrow(myGrid), ncol(myGrid), byrow=TRUE)
	xseqEdge = yFromRow(myGrid) - yFromCell(myGrid, edgeCell)
	points(xseqEdge, 
		varEdge[,colFromCell(myGrid, edgeCell)], 
		pch=3,col='red')
	points(xseqEdge, 
	  varEdgeCorr[,colFromCell(myGrid, edgeCell)], 
	  pch=3, col='blue')
	
	legend("topright", lty=c(1, NA, NA, NA, NA), 
	  pch=c(NA, 1, 3, 16, 16),
		col=c('black','black','black','red','blue'),
		legend=c('matern', 'middle','edge','unadj', 'adj')
		)


	# construct matern variance matrix

	myraster = attributes(precMat)$raster
	covMatMatern = matern(myraster, param=params)
 
 	prodUncor = crossprod(covMatMatern, precMat)
 	prodCor = crossprod(covMatMatern, precMatCorr)

 	quantile(Matrix::diag(prodUncor),na.rm=TRUE)
 	quantile(Matrix::diag(prodCor),na.rm=TRUE)
 	
 	quantile(prodUncor[lower.tri(prodUncor,diag=FALSE)],na.rm=TRUE)	
 	quantile(prodCor[lower.tri(prodCor,diag=FALSE)],na.rm=TRUE)	
}
 	





