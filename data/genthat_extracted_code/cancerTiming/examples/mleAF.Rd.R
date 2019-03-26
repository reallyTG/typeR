library(cancerTiming)


### Name: mleAF
### Title: Estimate the most likely allele frequency
### Aliases: mleAF

### ** Examples

	#example of CNLOH
	m<-c(24,41,40,15)
	x<-c(13,21,17,12)
	nc<-c(0.27,0.39,0.49,0.22)
	mleAF(x=x,m=m,totalCopy=2,maxCopy=2,normCont=nc)
	mleAF(x=x,m=m,totalCopy=c(2,3,2,3),maxCopy=2,normCont=nc)
	#note the difference in output if instead all data is from 
	#same sample (shares normal Contamination estimate)
	mleAF(x=x,m=m,totalCopy=2,maxCopy=2,normCont=nc[1])



