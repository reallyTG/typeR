library(rnaseqWrapper)


### Name: calcCombVals
### Title: Calculate group values from RNAseq data
### Aliases: calcCombVals

### ** Examples

## Only run if DESeq is available
if(require(DESeq)){

## Create sample data
## Could be reads or FPKM from your input
exampleCounts <- counts(makeExampleCountDataSet())


testComb <- calcCombVals(exampleCounts,
                         groupID=c("A","B","*"),
                         colID=c("all"))
head(testComb)
}



