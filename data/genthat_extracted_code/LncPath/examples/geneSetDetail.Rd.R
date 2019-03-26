library(LncPath)


### Name: geneSetDetail
### Title: Gain insight into the detail of the genes in a certain pathway
### Aliases: geneSetDetail
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

Result <- getExampleData("Result")
Detail <- geneSetDetail(Result, "KEGG_RIBOSOME")
head(Detail)




