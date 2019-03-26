library(phangorn)


### Name: read.nexus.splits
### Title: Function to import and export splits and networks
### Aliases: read.nexus.splits write.nexus.splits write.nexus.networx
###   read.nexus.networx write.splits
### Keywords: cluster

### ** Examples


(sp <- as.splits(rtree(5)))
write.nexus.splits(sp)
spl <- allCircularSplits(5)
plot(as.networx(spl), "2D")
write.splits(spl, print.labels = FALSE)




