library(MuFiCokriging)


### Name: SubstDesign
### Title: Imbrication of two experimental design sets
### Aliases: SubstDesign

### ** Examples

	dimension <- 2
	nD1 <- 100
	nD2 <- 50		
	set.seed(1);D1 <- matrix(runif(n=nD1*dimension, 0,1),ncol=dimension)
	set.seed(2);D2 <- matrix(runif(n=nD2*dimension, 0,1),ncol=dimension)
	subDes <- SubstDesign(PX2 = D2, PX1 = D1)

	op <- par(mfrow=c(2,1))
	plot(rbind(D1,D2),col=c(rep(1,nD1),rep(2,nD2)),
		pch=c(rep(1,nD1),rep(2,nD2)),xlab="x1",ylab="x2")
	plot(rbind(subDes$PX,D2),col=c(rep(1,dim(subDes$PX)[1]),rep(2,nD2)),
		pch=c(rep(1,dim(subDes$PX)[1]),rep(2,nD2)),xlab="x1",ylab="x2")



