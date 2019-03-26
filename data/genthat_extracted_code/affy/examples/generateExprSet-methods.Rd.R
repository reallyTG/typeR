library(affy)


### Name: generateExprSet-method
### Title: generate a set of expression values
### Aliases: generateExprSet-methods computeExprSet generateExprSet.methods
###   upDate.generateExprSet.methods
### Keywords: manip

### ** Examples

if (require(affydata)) {
  data(Dilution)

  ids <- c( "1000_at","1001_at")

  eset <- computeExprSet(Dilution, pmcorrect.method="pmonly",
                         summary.method="avgdiff", ids=ids)
}



