library(TraMineRextras)


### Name: seqtabstocc
### Title: Frequencies of state co-occurrence patterns
### Aliases: seqtabstocc
### Keywords: util

### ** Examples

## Creating a sequence object from the first 500 actcal data.
data(actcal)
actcal.seq <- seqdef(actcal[1:500,13:24])

## 10 most frequent state patterns in the data
seqtabstocc(actcal.seq)

## All state patterns
seqtabstocc(actcal.seq, idxs=0)




