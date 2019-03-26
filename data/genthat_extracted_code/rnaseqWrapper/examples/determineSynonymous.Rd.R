library(rnaseqWrapper)


### Name: determineSynonymous
### Title: Determine whether or not variants are synonomous
### Aliases: determineSynonymous

### ** Examples


## Load needed data
data(varScanExample)
data(fastaExample)

determineSynonymous(varTable=varScanExample,
                    refPosCol=2,
                    refAlleleCol="Ref",
                    varAlleleCol="Var",
                    referenceSeqs=fastaExample)
                 




