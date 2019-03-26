library(ctl)


### Name: CTLmapping
### Title: CTLmapping - Scan for correlated trait loci (CTL)
### Aliases: CTLmapping
### Keywords: methods

### ** Examples

  library(ctl)
  data(ath.metabolites) # Arabidopsis Thaliana dataset
  singlescan <- CTLmapping(ath.metab$genotypes, ath.metab$phenotypes, phenocol = 23)

  plot(singlescan)      # Plot the results of the CTL scan for the phenotype

  summary <- CTLsignificant(singlescan)
  summary               # Get a list of significant CTLs



