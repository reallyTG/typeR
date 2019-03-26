library(rEMM)


### Name: merge_clusters
### Title: Merge States of an EMM
### Aliases: merge_clusters merge_clusters,EMM,character-method
###   merge_clusters,EMM,integer-method
### Keywords: manip

### ** Examples

data("EMMTraffic")
emm <- EMM(measure="eJaccard", threshold=0.2)
build(emm, EMMTraffic)
states(emm)

## create a new emm with states 1-3 merged
emm_m123 <- merge_clusters(emm, c("1", "2", "3"))
states(emm_m123)



