library(cancerTiming)


### Name: eventTimingOverList
### Title: eventTiming for multiple samples and regions
### Aliases: eventTimingOverList getPi0Summary

### ** Examples

if(require(GenomicRanges)){
	#fix up mutation data to right format
	data(mutData)
	colnames(mutData)[1]<-c("chr")
	colnames(mutData)[grep("t_alt_count",colnames(mutData))]<-"nMutAllele"
	colnames(mutData)[grep("t_ref_count",colnames(mutData))]<-"nRefAllele"
	mutData$nReads<-mutData$nMutAllele+mutData$nRefAllele
	mutData$mutationId<-1:nrow(mutData)
	
	#add segmentation annotation -- second region is bogus, only for illustration
	segs<-data.frame(chr=c(17,17),start=c(1,1.8e7+100),end=c(1.8e7,81195210),
		normCont=0.22,segId=c("Seg1","Seg2"),type=c("CNLOH","SingleGain"))
	##Create Trivial segmentation annotation for example
	mutId<-mut2Seg(mutData,segs)
	eventOut<-eventTimingOverList(dfList=list(Sample1=mutId),normCont=0.22)
	getPi0Summary(eventOut)
}




