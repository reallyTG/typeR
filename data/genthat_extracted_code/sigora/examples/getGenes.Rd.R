library(sigora)


### Name: getGenes
### Title: List genes involved in present GPS for a specific pathway in the
###   summary_results
### Aliases: getGenes
### Keywords: functions

### ** Examples

a1<-genesFromRandomPathways(seed=12345,kegH,3,50)
## originally selected pathways:\cr
a1[["selectedPathways"]]
## what are the genes
a1[["genes"]]
## sigora's results with this input:\cr
sigoraRes <- sigora(GPSrepo =kegH, queryList = a1[["genes"]],level = 2)
## Genes related to the second most significant result:
getGenes(sigoraRes,2)



