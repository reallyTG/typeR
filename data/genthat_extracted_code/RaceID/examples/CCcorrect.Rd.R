library(RaceID)


### Name: CCcorrect
### Title: Dimensional Reduction by PCA or ICA
### Aliases: CCcorrect

### ** Examples

sc <- SCseq(intestinalDataSmall)
sc <- filterdata(sc)
sc <- CCcorrect(sc,dimR=TRUE,nComp=3)



