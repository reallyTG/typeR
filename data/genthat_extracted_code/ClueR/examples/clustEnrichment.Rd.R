library(ClueR)


### Name: clustEnrichment
### Title: Cluster enrichment test
### Aliases: clustEnrichment

### ** Examples

# simulate a time-series data with six distinctive profile groups and each group with
# a size of 500 phosphorylation sites.
simuData <- temporalSimu(seed=1, groupSize=500, sdd=1, numGroups=4)

# create an artificial annotation database. Generate 100 kinase-substrate groups each
# comprising 50 substrates assigned to a kinase. 
# among them, create 5 groups each contains phosphorylation sites defined to have the
# same temporal profile.   
kinaseAnno <- list()
groupSize <- 500
for (i in 1:5) {
 kinaseAnno[[i]] <- paste("p", (groupSize*(i-1)+1):(groupSize*(i-1)+50), sep="_")
}
   
for (i in 6:100) {
 set.seed(i)
 kinaseAnno[[i]] <- paste("p", sample.int(nrow(simuData), size = 50), sep="_")
}
names(kinaseAnno) <- paste("KS", 1:100, sep="_")

# testing enrichment of clustering results by partition the data into six clusters
# using cmeans algorithm.
clustObj <- cmeans(simuData, centers=6, iter.max=50, m=1.25)
clustEnrichment(clustObj, annotation=kinaseAnno, effectiveSize=c(5, 100), pvalueCutoff=0.05)




