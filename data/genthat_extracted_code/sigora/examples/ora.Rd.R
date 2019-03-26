library(sigora)


### Name: ora
### Title: Traditional Overrepresentation Analysis.
### Aliases: ora
### Keywords: functions

### ** Examples

data(kegM)
## select 50 genes from 3 mouse pathways
a1<-genesFromRandomPathways(seed=345,kegM,3,50)
## originally selected pathways:
a1[["selectedPathways"]]
## compare to traditional methods results:
oraRes <- ora(a1[["genes"]],kegM)
dim(oraRes)
oraRes



