library(rnaseqWrapper)


### Name: runGOAnalysis
### Title: Run basic GO analysis
### Aliases: runGOAnalysis

### ** Examples


## Only run if topGO is available
if(require(topGO)){

## Load the sample data from topGO
data(GOdata)

## Recreate the GO annotation
## NB: you will likely do this with readMappings()
goAnno <- inverseList(genesInTerm(GOdata,usedGO(GOdata)))

testOut <- runGOAnalysis(sigGenes(GOdata),
                         allGenes(GOdata),
                         goAnno,
                         algorithm = "classic",
                         pValThresh = 0.05)
                         
head(testOut)

}



