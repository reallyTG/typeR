library(cancerTiming)


### Name: labelSeg
### Title: Helper functions for plotting
### Aliases: labelSeg numChromosome divideGenome

### ** Examples

data(mutData)
segData<-data.frame(chromosome="17",start=c(0,1.8e7+1),
    end=c(1.8e7,max(mutData$position)),totalCpy=c(2,NA),
    markRegion=c(FALSE,TRUE))
if(require(GenomicRanges) & require(IRanges)) labelSeg(chr=segData$chromosome,
    start=segData$start,end=segData$end)
chr<-c("1","4","10","23","X")
chr[order(chr)]
chr[order(numChromosome(chr))]



