library(paleotree)


### Name: seqTimeList
### Title: Construct a Stochastic Sequenced Time-List from an Unsequenced
###   Time-List
### Aliases: seqTimeList

### ** Examples

#Simulate some fossil ranges with simFossilRecord
set.seed(444)
record <- simFossilRecord(p = 0.1, q = 0.1, nruns = 1,
nTotalTaxa = c(60,80), nExtant = 0)
taxa <- fossilRecord2fossilTaxa(record)
#simulate a fossil record with imperfect sampling with sampleRanges()
rangesCont <- sampleRanges(taxa,r = 0.1)

#Now let's use binTimeData to get ranges in discrete overlapping intervals
    #via pre-set intervals input
presetIntervals <- cbind(c(1000,995,990,980,970,975,960,950,940,930,900,890,888,879,875),
  c(995,989,960,975,960,950,930,930,930,900,895,888,880,875,870))
rangesDisc1 <- binTimeData(rangesCont,int.times = presetIntervals)

seqLists <- seqTimeList(rangesDisc1,nruns = 10)
seqLists$nTaxa
seqLists$nIntervals

#apply freqRat as an example analysis
sapply(seqLists$timeLists,freqRat)

#notice the zero and infinite freqRat estimates? What's going on?

freqRat(seqLists$timeLists[[4]],plot = TRUE)

#too few taxa of two or three interval durations for the ratio to work properly
    #perhaps ignore these estimates

#with weighted selection of intervals
seqLists <- seqTimeList(rangesDisc1,nruns = 10,weightSampling = TRUE)

seqLists$nTaxa
seqLists$nIntervals
sapply(seqLists$timeLists,freqRat)

#didn't have much effect in this simulated example



