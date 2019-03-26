library(ParDNAcopy)


### Name: parSegment
### Title: Parallel implementation of 'segment' function of 'DNAcopy'
### Aliases: parSegment

### ** Examples

data(coriell)
#prepare data for segmentation
CNA.object <- CNA(genomdat=coriell[,c(4,5)],coriell$Chromosome,coriell$Position,
	data.type="logratio",sampleid=dimnames(coriell)[[2]][4:5])
#equivalent to "segment" of DNAcopy
parseg<-parSegment(CNA.object,undo.splits="sdundo")
#Random number generator to be re-seeded for each sample
parsegrep<-parSegment(CNA.object,ranseed=123,undo.splits="sdundo")
#multi-core execution but the result should not change
parsegrep1<-parSegment(CNA.object,ranseed=123,distrib="Rparallel",njobs=2,
undo.splits="sdundo")



