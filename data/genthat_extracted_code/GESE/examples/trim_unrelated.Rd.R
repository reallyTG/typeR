library(GESE)


### Name: trim_unrelated
### Title: Trims the pedigree structure to exclude multiple founder cases
### Aliases: trim_unrelated
### Keywords: pedigree

### ** Examples

data(pednew)
data(mapInfo)
data(dataRaw)
data(database)
subjects <- dataRaw[,c(1:2, 6)]
cat("Trimming the families...\n")
cat("Trimming step 1: keep only one lineage \n")
trim <- trim_oneLineage(seqSub=subjects, pednew)
subjects2 <- trim_unrelated(trim$seqSubjUpdate, trim$pedInfoUpdate)

	



