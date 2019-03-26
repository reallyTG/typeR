library(sigora)


### Name: genesFromRandomPathways
### Title: Function to randomly select genes associated with randomly
###   pathways.
### Aliases: genesFromRandomPathways
### Keywords: functions

### ** Examples

## select 50 genes from 3 human KEGG pathways
a1<-genesFromRandomPathways(seed=12345,kegH,3,50)
## originally selected pathways:
a1[["selectedPathways"]]
## what are the genes
a1[["genes"]]
## sigora's results
sigoraRes <- sigora(GPSrepo =kegH, queryList = a1[["genes"]],
        level = 4)
## compare to traditional methods results:
oraRes <- ora(a1[["genes"]],kegH)
dim(oraRes)
oraRes



