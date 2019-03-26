library(paleotree)


### Name: simFossilRecordMethods
### Title: Methods for Editing or Converting Output from simFossilRecord
### Aliases: simFossilRecordMethods timeSliceFossilRecord
###   fossilRecord2fossilTaxa fossilRecord2fossilRanges
###   fossilRecord2fossilTaxa fossilTaxa2fossilRecord
###   fossilRecord2fossilRanges

### ** Examples


set.seed(44)
record <- simFossilRecord(p = 0.1, q = 0.1, r = 0.1, nruns = 1,
	nTotalTaxa = c(20,30) ,nExtant = 0, plot = TRUE)

# time-slicing

# let's try slicing this record at 940 time-units
slicedRecord <- timeSliceFossilRecord(fossilRecord = record, sliceTime = 940)
# and let's plot it
divCurveFossilRecordSim(slicedRecord)

# now with shiftRoot4TimeSlice = TRUE to shift the root age
slicedRecord <- timeSliceFossilRecord(fossilRecord = record, sliceTime = 940,
	shiftRoot4TimeSlice = TRUE)
# and let's plot it
divCurveFossilRecordSim(slicedRecord)

# plot look a little different due to how axis limits are treated...
# notice that in both, 'modern' (extant) taxa are sampled with probability = 1
	#let's try it again, make that probability = 0

# now with shiftRoot4TimeSlice = TRUE
slicedRecord <- timeSliceFossilRecord(fossilRecord = record, sliceTime = 940,
	shiftRoot4TimeSlice = TRUE, modern.samp.prob = 0)
# and let's plot it
divCurveFossilRecordSim(slicedRecord)

############################

# converting to taxa objects and observed ranges

# convert to taxa data
taxa <- fossilRecord2fossilTaxa(record)
# convert to ranges
ranges <- fossilRecord2fossilRanges(record)

# plot diversity curves with multiDiv
multiDiv(list(taxa,ranges),plotMultCurves = TRUE)
# should look a lot like what we got earlier

# get the cladogram we'd obtain for these taxa with taxa2cladogram
cladogram <- taxa2cladogram(taxa,plot = TRUE)

# now get the time-scaled phylogenies with taxa2phylo

# first, with tips extending to the true times of extinction
treeExt <- taxa2phylo(taxa,plot = TRUE)

# now, with tips extending to the first appearance dates (FADs) of taxa
	# get the FADs from the ranges
FADs <- ranges[,1]
treeFAD <- taxa2phylo(taxa,FADs,plot = TRUE)




