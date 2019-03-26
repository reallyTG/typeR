library(LncPath)


### Name: lncPath
### Title: Identify pathways synergisticly regulated by lncRNA sets.
### Aliases: lncPath
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
## get example data
SigLncs <- getExampleData("SigLncs")
head(SigLncs)

ExampleNet <- getExampleData("ExampleNet")
head(ExampleNet)

##run lncPath
Result <- lncPath(SigLncs, ExampleNet,  Weighted = TRUE, PathwayDataSet = "KEGG", nperm = 100,
 minPathSize = 0, maxPathSize = 500)

## Print to table
Table <- lncPath2Table(Result)
head(Table)




