library(affy)


### Name: barplot.ProbeSet
### Title: show a ProbeSet as barplots
### Aliases: barplot.ProbeSet
### Keywords: hplot

### ** Examples

if (require(affydata)) {
  data(Dilution)
  gn <- geneNames(Dilution)
  pps <- probeset(Dilution, gn[1])[[1]]

  barplot.ProbeSet(pps)
}



