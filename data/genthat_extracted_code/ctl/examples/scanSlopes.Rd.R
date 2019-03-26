library(ctl)


### Name: scanSlopes
### Title: scanSlopes - Create a slope difference profile between two
###   traits
### Aliases: scanSlopes
### Keywords: methods

### ** Examples

  library(ctl)
  data(ath.metabolites)                 # Arabidopsis Thaliana data set

  slopes <- scanSlopes(ath.metab$genotypes, ath.metab$phenotypes[,1:4], phenocol = 2)
  image(1:nrow(slopes), 1:ncol(slopes), -log10(slopes))



