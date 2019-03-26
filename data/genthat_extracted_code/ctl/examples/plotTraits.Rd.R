library(ctl)


### Name: plotTraits
### Title: plotTraits - Trait vs Trait scatterplot, colored by the selected
###   genetic locus
### Aliases: plotTraits
### Keywords: methods

### ** Examples

  library(ctl)
  data(ath.metabolites)                 # Arabidopsis Thaliana data set

  plotTraits(ath.metab$genotypes, ath.metab$phenotypes, marker=75, doRank = TRUE)



