library(locpol)


### Name: denCVBwSelC
### Title: CV bandwidth selector for density
### Aliases: denCVBwSelC
### Keywords: nonparametric smooth

### ** Examples

stdy <- function(size=100,rVar=rnorm,dVar=dnorm,kernel=gaussK,x=NULL)
{
	if( is.null(x) ) x <- rVar(size)
	Tc <- system.time( dbwc <- denCVBwSelC(x,kernel) )[3]
	ucvT <- system.time( ucvBw <- bw.ucv(x,lower=0.00001,upper=2.0) )[3]
	nrdT <- system.time( nrdBw <- bw.nrd(x) )[3]
	{
		xeval <- seq( min(x)+dbwc , max(x)-dbwc ,length=50)
		hist(x,probability=TRUE)
		lines(xeval,trueDen <- dVar(xeval),col="red")
		lines(density(x),col="cyan")
		xevalDenc <- PRDenEstC(x,xeval,dbwc,kernel)
		dencMSE <- mean( (trueDen-xevalDenc)^2 )
		xevalucvDen <- PRDenEstC(x,xeval,ucvBw,kernel)
		ucvMSE <- mean( (trueDen-xevalucvDen)^2 )
		xevalDenNrd <- PRDenEstC(x,xeval,nrdBw,kernel)
		nrdMSE <- mean( (trueDen-xevalDenNrd)^2 )
		lines(xevalDenc,col="green")
		lines(xevalucvDen,col="blue")
		lines(xevalDenNrd,col="grey")
	}
	return( cbind(  bwVal=c(evalC=dbwc,ucvBw=ucvBw,nrdBw=nrdBw),
				mse=c(dencMSE,ucvMSE,nrdMSE), 
				time=c(Tc,ucvT,nrdT) ) )
}
stdy(100,kernel=gaussK) 
stdy(100,rVar=rexp,dVar=dexp,kernel=gaussK)
##	check stdy with other kernel, distributions	



