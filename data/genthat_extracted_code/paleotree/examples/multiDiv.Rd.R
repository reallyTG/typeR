library(paleotree)


### Name: multiDiv
### Title: Calculating Diversity Curves Across Multiple Datasets
### Aliases: multiDiv plotMultiDiv plotMultiDiv

### ** Examples


set.seed(444)
record <- simFossilRecord(p = 0.1, q = 0.1, nruns = 1,
	nTotalTaxa = c(30,40), nExtant = 0)
taxa <- fossilRecord2fossilTaxa(record)
rangesCont <- sampleRanges(taxa, r = 0.5)
rangesDisc <- binTimeData(rangesCont, int.length = 1)
cladogram <- taxa2cladogram(taxa, plot = TRUE)
#using multiDiv with very different data types
ttree <- timePaleoPhy(cladogram, rangesCont, type = "basic", add.term = TRUE, plot = FALSE)
input <- list(rangesCont, rangesDisc, ttree)
multiDiv(input, plot = TRUE)

#using fixed interval times
multiDiv(input, int.times = rangesDisc[[1]], plot = TRUE)

#using multiDiv with samples of trees
ttrees <- timePaleoPhy(cladogram, rangesCont, type = "basic",
    randres = TRUE, ntrees = 10, add.term = TRUE)
multiDiv(ttrees)
#uncertainty in diversity history is solely due to 
   #the random resolution of polytomies

#multiDiv can also take output from simFossilRecord, via fossilRecord2fossilTaxa
#what do many simulations run under some set of conditions 'look' like on average?
set.seed(444)
records <- simFossilRecord(p = 0.1, q = 0.1, nruns = 10,
 totalTime = 30, plot = TRUE)
taxa <- sapply(records,fossilRecord2fossilTaxa)
multiDiv(taxa)
#increasing cone of diversity! 
#Even better on a log scale:
multiDiv(taxa, plotLogRich = TRUE)

#pure-birth example with simFossilRecord
#note that conditioning is tricky
set.seed(444)
recordsPB <- simFossilRecord(p = 0.1, q = 0, nruns = 10,
 totalTime = 30,plot = TRUE)
taxaPB <- sapply(recordsPB,fossilRecord2fossilTaxa)
multiDiv(taxaPB,plotLogRich = TRUE)

#compare many discrete diversity curves
discreteRanges <- lapply(taxa,function(x)
	binTimeData(sampleRanges(x, r = 0.5,
    		min.taxa = 1), int.length = 7))
multiDiv(discreteRanges)

layout(1)




