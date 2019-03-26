library(ctl)


### Name: CTLscan
### Title: CTLscan - Scan for Correlated Trait Locus (CTL)
### Aliases: CTLscan
### Keywords: methods

### ** Examples

  library(ctl)
  data(ath.metabolites)                 # Arabidopsis Thaliana data set

  ctlscan <- CTLscan(ath.metab$genotypes, ath.metab$phenotypes, phenocol=1:4)
  ctlscan

  # Genetic regions with significant CTLs found for the first phenotype
  CTLregions(ctlscan, ath.metab$map, phenocol = 1)
  
  summary <- CTLsignificant(ctlscan)    # Matrix of Trait, Marker, Trait interactions 
  summary                               # Get a list of significant CTLs

  nodes <- ctl.lineplot(ctlscan, ath.metab$map)  # Line plot the phenotypes
  nodes



