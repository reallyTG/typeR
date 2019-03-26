library(affy)


### Name: expresso
### Title: From raw probe intensities to expression values
### Aliases: expresso bgcorrect
### Keywords: manip

### ** Examples

if (require(affydata)) {
  data(Dilution)

  eset <- expresso(Dilution, bgcorrect.method="rma",
                   normalize.method="constant",pmcorrect.method="pmonly",
                   summary.method="avgdiff")

  ##to see options available for bg correction type:
  bgcorrect.methods()
}



