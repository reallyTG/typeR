library(sybil)


### Name: oneGeneDel
### Title: Single Gene Deletion Experiment
### Aliases: oneGeneDel
### Keywords: optimize

### ** Examples

  # load example data set
  data(Ec_core)
  
  # compute phenotypes of genetic perturbations via
  # FBA (default)
  Ec_ogd <- oneGeneDel(Ec_core)
  
  # or MOMA (linearized version)
  Ec_ogd <- oneGeneDel(Ec_core, algorithm = "lmoma")



