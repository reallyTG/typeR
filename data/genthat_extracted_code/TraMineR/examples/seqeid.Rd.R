library(TraMineR)


### Name: seqeid
### Title: Retrieve unique ids from an event sequence object.
### Aliases: seqeid
### Keywords: Event sequences Sequence-object attributes

### ** Examples

data(actcal.tse)
actcal.eseq <- seqecreate(actcal.tse)
sid <- seqeid(actcal.eseq)
length(sid)
head(sid)



