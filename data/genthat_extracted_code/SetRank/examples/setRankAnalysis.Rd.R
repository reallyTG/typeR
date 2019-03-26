library(SetRank)


### Name: setRankAnalysis
### Title: Advanced gene set enrichment analysis.
### Aliases: setRankAnalysis

### ** Examples

options(mc.cores=1)
reference = sprintf("gene_%03d", 1:50)
geneSets = lapply(1:9, function(i) sample(reference[((i-1)*5):((i+1)*5)], 5))
annotationTable = data.frame(termID=sprintf("set_%02d", rep(1:9, each=5)), 
        geneID=unlist(geneSets),
        termName = sprintf("dummy gene setet %d", rep(1:9, each=5)),
        dbName = "dummyDB",
        description = "A dummy gene set DB for testing purposes")
collection = buildSetCollection(annotationTable, referenceSet=reference)
genes = reference[sample(c(TRUE, FALSE), 50, TRUE)]
network = setRankAnalysis(genes, collection, TRUE)




