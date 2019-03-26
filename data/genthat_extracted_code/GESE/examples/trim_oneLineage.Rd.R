library(GESE)


### Name: trim_oneLineage
### Title: Trims the pedigree structure to include one lineage only.
### Aliases: trim_oneLineage
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
	



