library(SetRank)


### Name: buildSetCollection
### Title: Create a gene set collection
### Aliases: buildSetCollection

### ** Examples

options(mc.cores=1)
referenceSet = sprintf("gene_%02d", 1:50)
geneSets = lapply(1:9, function(i) sample(referenceSet[((i-1)*5):((i+1)*5)], 5))
annotationTable = data.frame(termID=sprintf("set_%02d", rep(1:9, each=5)), 
        geneID=unlist(geneSets),
        termName = sprintf("dummy gene set %d", rep(1:9, each=5)),
        dbName = "dummyDB",
        description = "A dummy gene set DB for testing purposes")
collection = buildSetCollection(annotationTable, referenceSet=referenceSet)



