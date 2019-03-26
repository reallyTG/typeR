library(TraMineRextras)


### Name: rowmode
### Title: Modal state of a variable
### Aliases: rowmode
### Keywords: util

### ** Examples

data(actcal)
actcal.seq <- seqdef(actcal[1:10,13:24])
actcal.mod <- apply(as.matrix(actcal.seq), 1, rowmode)
head(actcal.mod)




