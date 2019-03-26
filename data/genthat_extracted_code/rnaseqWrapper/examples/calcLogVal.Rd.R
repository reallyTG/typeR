library(rnaseqWrapper)


### Name: calcLogVal
### Title: Calculate log value of RNAseq columns
### Aliases: calcLogVal

### ** Examples

## Only run if DESeq is available
if(require(DESeq)){

## Create sample data
## Could be reads or FPKM from your input
exampleCounts <- counts(makeExampleCountDataSet())

## Only calculate for the "2" columns
## This could be reads, if you have multiple column types
testLog <- calcLogVal(exampleCounts,
                      colID="2",
                      matchEnd=TRUE)
head(testLog)

## Calculate log of all columns
testLog2 <- calcLogVal(exampleCounts,
                       colID="*",
                       setBase=2)
head(testLog2)

}



