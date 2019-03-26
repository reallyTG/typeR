library(TraMineR)


### Name: seqelength
### Title: Lengths of event sequences
### Aliases: seqelength seqelength<-
### Keywords: Event sequences Longitudinal characteristics

### ** Examples

data(actcal.tse)
actcal.eseq <- seqecreate(actcal.tse)
## Since end.event is not specified, contains no sequence lengths
## We set them manually as 12 for all sequences
sl <- numeric()
sl[1:2000] <- 12
seqelength(actcal.eseq) <- sl
actcal.eseq[1:10]
## Retrieve lengths
slen <- seqelength(actcal.eseq)
summary(slen)



