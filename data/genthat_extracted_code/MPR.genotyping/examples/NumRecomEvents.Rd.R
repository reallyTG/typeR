library(MPR.genotyping)


### Name: NumRecomEvents
### Title: calculate the number of recombination events
### Aliases: NumRecomEvents
### Keywords: MPR

### ** Examples

set.seed(123)
data(myBaseData)
allele.random <- base2Allele(myBaseData)
NumRecomEvents(myBaseData,allele.random)
# 162



