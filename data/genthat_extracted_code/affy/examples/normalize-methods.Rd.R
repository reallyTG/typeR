library(affy)


### Name: normalize-methods
### Title: Normalize Affymetrix Probe Level Data - methods
### Aliases: normalize.AffyBatch normalize.methods
###   normalize.AffyBatch.methods upDate.normalize.AffyBatch.methods
###   normalize,AffyBatch-method normalize.methods,AffyBatch-method
###   normalize.AffyBatch.methods bgcorrect.methods
###   upDate.bgcorrect.methods pmcorrect.methods upDate.pmcorrect.methods
### Keywords: manip

### ** Examples

if (require(affydata)) {
  data(Dilution)
  normalize.methods(Dilution)
  generateExprSet.methods()
  bgcorrect.methods()
  pmcorrect.methods()
}



