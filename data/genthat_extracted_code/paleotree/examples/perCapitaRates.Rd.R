library(paleotree)


### Name: perCapitaRates
### Title: perCapitaRates
### Aliases: perCapitaRates

### ** Examples


#with the retiolinae dataset
data(retiolitinae)
perCapitaRates(retioRanges)

#Simulate some fossil ranges with simFossilRecord
set.seed(444)
record <- simFossilRecord(p = 0.1, q = 0.1, nruns = 1,
nTotalTaxa = c(80,100), nExtant = 0)
taxa <- fossilRecord2fossilTaxa(record)
#simulate a fossil record with imperfect sampling with sampleRanges()
rangesCont <- sampleRanges(taxa,r = 0.5)
#Now let's use binTimeData() to bin in intervals of 5 time units
rangesDisc <- binTimeData(rangesCont,int.length = 5)
#and get the per-capita rates
perCapitaRates(rangesDisc)
#on a log scale
perCapitaRates(rangesDisc,logRates = TRUE)

#get mean and median per-capita rates
res <- perCapitaRates(rangesDisc,plot = FALSE)
apply(res[,c("pRate","qRate")],2,mean,na.rm = TRUE)
apply(res[,c("pRate","qRate")],2,median,na.rm = TRUE)

#with modern taxa
set.seed(444)
record <- simFossilRecord(p = 0.1, q = 0.1, nruns = 1,
	nExtant = c(10,50))
taxa <- fossilRecord2fossilTaxa(record)
#simulate a fossil record with imperfect sampling with sampleRanges()
rangesCont <- sampleRanges(taxa,r = 0.5,,modern.samp.prob = 1)
#Now let's use binTimeData() to bin in intervals of 5 time units
rangesDisc <- binTimeData(rangesCont,int.length = 5)
#and now get per-capita rates
perCapitaRates(rangesDisc)




