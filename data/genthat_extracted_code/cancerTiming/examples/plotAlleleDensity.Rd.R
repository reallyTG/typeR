library(cancerTiming)


### Name: plotAlleleDensity
### Title: Plot density/histogram of allele frequencies
### Aliases: plotAlleleDensity

### ** Examples

data(mutData)
#only mutations in the CNLOH region
onlyMuts<-subset(mutData,is.na(rsID) & position <= 1.8E7) 
plotAlleleDensity(onlyMuts$allelefreq,onlyMuts$t_ref_count+onlyMuts$t_alt_count,
	totalCopy=2,normCont=c(0,0.22),minMut=0,minDepth=0,hist=TRUE)

gpId<-factor(is.na(mutData$rsID),levels=c("TRUE","FALSE"),labels=c("Mutations","SNPs"))
plotAlleleDensity(mutData$allelefreq,mutData$t_ref_count+mutData$t_alt_count,
	groupCol=c("black","red"),totalCopy=2,groupingId=gpId,minMut=0,minDepth=30,hist=FALSE)
legend("topleft",levels(gpId),fill=c("red","black"))



