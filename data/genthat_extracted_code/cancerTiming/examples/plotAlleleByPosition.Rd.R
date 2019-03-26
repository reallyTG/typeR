library(cancerTiming)


### Name: plotAlleleByPosition
### Title: Plot allele frequencies by position
### Aliases: plotAlleleByPosition

### ** Examples

data(mutData)
 #only mutations in the CNLOH region
onlyMuts<-subset(mutData,is.na(rsID) & position <= 1.8E7)
	snps<-subset(mutData,!is.na(rsID) )
segData<-data.frame(chromosome="17",start=c(0,1.8e7+1),
	end=c(1.8e7,max(mutData$position)),
	totalCpy=c(2,NA),markRegion=c(FALSE,TRUE))
out<-plotAlleleByPosition(onlyMuts,whChr=17, segmentData=segData,
	tCNId="totalCpy",normCont=0.22, addData=snps,pch=19,
	addColor="grey",MarkId="markRegion",
	segColors="pink",xaxt="n",xlab="Position", segFactorId="totalCpy",
	chromosomeId = "chromosome",tumorAFId="allelefreq", 
	positionId="position",type="mutation") 
axis(1,line=1,tick=FALSE)
legend("topright",legend=c(names(out),"unknown"),fill=c(out,NA),
	title="Total Copy Number")




