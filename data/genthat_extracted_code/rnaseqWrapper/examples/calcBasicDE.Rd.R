library(rnaseqWrapper)


### Name: calcBasicDE
### Title: Calculate basics differential expression between pairs of
###   columns
### Aliases: calcBasicDE

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

basicTest <- calcBasicDE(testComb,"all_mean")

head(basicTest)

}






