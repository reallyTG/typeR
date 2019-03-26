library(rnaseqWrapper)


### Name: DESeqWrapper
### Title: A wrapper for DESeq
### Aliases: DESeqWrapper plotDE plotDispEsts

### ** Examples

## Only run if DESeq is available
if(require(DESeq)){

## Create an example count data set
exampleCounts <- counts(makeExampleCountDataSet())[1:500,]

## Note, from your data, this might look like:
# exampleCounts <- myInputData[,grep("READS",names(myInputData))]
# row.names(exampleCounts) <- myInputData$geneNameColumn

## Note, outputs save to disk are turned off
## Set each to TRUE to save to your working directory
test <- DESeqWrapper(exampleCounts,
                     conditions=c("A","B"),
                     writeScaled=FALSE,
                     writeDE=FALSE,
                     makePDFs=FALSE)

## Look at the outputs
head(test$deOutputs$AvsB)
head(test$normalizedReads)
head(test$isSignificant)

}



