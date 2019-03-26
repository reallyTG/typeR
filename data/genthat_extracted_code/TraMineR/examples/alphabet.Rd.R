library(TraMineR)


### Name: alphabet
### Title: Get or set the alphabet of a state or event sequence object
### Aliases: alphabet alphabet<-
### Keywords: Sequence-object attributes

### ** Examples

## Creating a sequence object with the columns 13 to 24
## in the 'actcal' example data set
data(actcal)
actcal.seq <- seqdef(actcal,13:24)

## Retrieving the alphabet
alphabet(actcal.seq)

## Setting the alphabet
alphabet(actcal.seq) <- c("FT", "PT", "LT", "NO")

## Event sequences
actcal.eseq <- seqecreate(actcal.seq)
alphabet(actcal.eseq)



