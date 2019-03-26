library(affy)


### Name: pmcorrect
### Title: PM Correction
### Aliases: pmcorrect pmcorrect.pmonly pmcorrect.mas pmcorrect.subtractmm
### Keywords: manip

### ** Examples

if (require(affydata)) {
  data(Dilution)
  gn <- geneNames(Dilution)
  pps <- probeset(Dilution, gn[1])[[1]]

  pps.pmonly <- pmcorrect.pmonly(pps)
  pps.subtractmm <- pmcorrect.subtractmm(pps)
  pps.mas5 <- pmcorrect.mas(pps)
}



