library(paleotree)


### Name: horizonSampRate
### Title: Estimate Sampling Rate from Sampling Horizon Data (Solow and
###   Smith, 1997)
### Aliases: horizonSampRate

### ** Examples

#can simulate this type of data with sampleRanges
    # just set ranges.only = FALSE
#let's try a simulation example:
set.seed(444)
record <- simFossilRecord(p = 0.1, q = 0.1, nruns = 1,
nTotalTaxa = c(30,40), nExtant = 0)
taxa <- fossilRecord2fossilTaxa(record)
sampledOccurrences <- sampleRanges(taxa,r = 0.5,ranges.only = FALSE)

# now try with horizonSampRate
horizonSampRate(sampOcc = sampledOccurrences)

# but we could also try with the *other* inputs
   # useful because some datasets we may only have durations
   # and number of sampling events for
filtered <- sampledOccurrences[!is.na(sampledOccurrences)] 
dur <- sapply(filtered,max) - sapply(filtered,min)
nCol <- sapply(filtered,length)
# supply as durations and nCollections
horizonSampRate(durations = dur, nCollections = nCol)



