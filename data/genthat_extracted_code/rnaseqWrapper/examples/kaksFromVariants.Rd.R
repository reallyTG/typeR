library(rnaseqWrapper)


### Name: kaksFromVariants
### Title: Calculate Ka/Ks ratios from a table of variants
### Aliases: kaksFromVariants

### ** Examples


## Load needed data
data(varScanExample)
data(fastaExample)

kaksFromVariants(varTable=varScanExample,
                 refPosCol=2,
                 refAlleleCol="Ref",
                 varAlleleCol="Var",
                 referenceSeqs=fastaExample)
                 




