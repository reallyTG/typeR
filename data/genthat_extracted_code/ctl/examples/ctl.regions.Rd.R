library(ctl)


### Name: CTLregions
### Title: CTLregions - Get all significant interactions from a genome-wide
###   CTLscan
### Aliases: CTLregions
### Keywords: methods

### ** Examples

  library(ctl)
  
  data(ath.metabolites)                 # Arabidopsis Thaliana data set
  data(ath.result)                      # Arabidopsis Thaliana CTL results
  regions <- CTLregions(ath.result, ath.metab$map)



