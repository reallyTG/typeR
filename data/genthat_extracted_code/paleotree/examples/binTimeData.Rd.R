library(paleotree)


### Name: binTimeData
### Title: Bin Simulated Temporal Ranges in Discrete Intervals
### Aliases: binTimeData

### ** Examples


#Simulate some fossil ranges with simFossilRecord
set.seed(444)
record <- simFossilRecord(p = 0.1, q = 0.1, nruns = 1,
nTotalTaxa = c(30,40), nExtant = 0)
taxa <- fossilRecord2fossilTaxa(record)
#simulate a fossil record with imperfect sampling with sampleRanges()
rangesCont <- sampleRanges(taxa,r = 0.5)
#Now let's use binTimeData() to bin in intervals of 1 time unit
rangesDisc <- binTimeData(rangesCont,int.length = 1)
#plot with taxicDivDisc()
equalDiscInt <- taxicDivDisc(rangesDisc)

#example with pre-set intervals input (including overlapping)
presetIntervals <- cbind(c(1000,990,970,940),c(980,970,950,930))
rangesDisc1 <- binTimeData(rangesCont,int.times = presetIntervals)
taxicDivDisc(rangesDisc1)
#now let's plot diversity with (different) equal length intervals used above
taxicDivDisc(rangesDisc1,int.times = equalDiscInt[,1:2])

#example with extant taxa
set.seed(444)
record <- simFossilRecord(p = 0.1, q = 0.1, nruns = 1,
nTotalTaxa = c(30,40))
taxa <- fossilRecord2fossilTaxa(record)
#simulate a fossil record with imperfect sampling with sampleRanges()
rangesCont <- sampleRanges(taxa,r = 0.5,,modern.samp.prob = 1)
#Now let's use binTimeData() to bin in intervals of 1 time unit
rangesDisc <- binTimeData(rangesCont,int.length = 1)
#plot with taxicDivDisc()
taxicDivDisc(rangesDisc)

#example with pre-set intervals input (including overlapping)
presetIntervals <- cbind(c(40,30,20,10),c(30,20,10,0))
rangesDisc1 <- binTimeData(rangesCont,int.times = presetIntervals)
taxicDivDisc(rangesDisc1)




