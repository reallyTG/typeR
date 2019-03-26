library(cancerTiming)


### Name: mut2Seg
### Title: Align mutations to segments
### Aliases: mut2Seg

### ** Examples

if(require(GenomicRanges) & require(IRanges)){
	data(mutData)
	colnames(mutData)[1]<-c("chr")
	segs<-data.frame(chr=c(17,17),start=c(1,1.8e7+100),end=c(1.8e7,81195210),
		normCont=0.22,segId=c("CNLOH","Other"))
	##Trivial segmentation annotation for example
	mutId<-mut2Seg(mutData,segs)
	head(mutId)	
}




