library(ctl)


### Name: QTLmapping
### Title: QTLmapping - QTL mapping method for CTL analysis
### Aliases: QTLmapping
### Keywords: methods

### ** Examples

  library(ctl)
  data(ath.metabolites) # Arabidopsis Thaliana dataset
  qtldata <- QTLmapping(ath.metab$genotypes, ath.metab$phenotypes, phenocol = 23)
  plot(qtldata)         # Plot the results of the QTL scan for the phenotype



