library(TraMineR)


### Name: seqsubsn
### Title: Number of distinct subsequences in a sequence.
### Aliases: seqsubsn
### Keywords: Longitudinal characteristics

### ** Examples

data(actcal)
actcal.seq <- seqdef(actcal,13:24)

## Number of subsequences with DSS=TRUE
seqsubsn(actcal.seq[1:10,])

## Number of subsequences with DSS=FALSE
seqsubsn(actcal.seq[1:10,],DSS=FALSE)



