library(TraMineRextras)


### Name: pamward
### Title: PAM from k-solution of hierarchical clustering
### Aliases: pamward
### Keywords: util

### ** Examples

library(cluster)
data(actcal)
actcal.seq <- seqdef(actcal[1:200,13:24])
actcal.ham <- seqdist(actcal.seq, method = "HAM")
clust <- pamward(actcal.ham, k = 4)
table(clust$clustering)



