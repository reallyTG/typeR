library(TraMineRextras)


### Name: seqauto
### Title: Auto-association between states
### Aliases: seqauto
### Keywords: state sequences

### ** Examples

data(biofam)

biofam.seq <- seqdef(biofam[1:100,10:25])
aa <- seqauto(biofam.seq, order=5)
aa



