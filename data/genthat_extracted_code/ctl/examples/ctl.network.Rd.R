library(ctl)


### Name: CTLnetwork
### Title: CTLnetwork - Interaction network from a genome-wide CTLscan of
###   multiple traits
### Aliases: CTLnetwork
### Keywords: methods

### ** Examples

  library(ctl)
  data(ath.result)       # Arabidopsis Thaliana results
  data(ath.metabolites)  # Arabidopsis Thaliana data set

  ctls <- CTLnetwork(ath.result, significance = 0.1)
  op <- par(mfrow = c(2,1))
  plot(ctls)
  ctl.lineplot(ath.result, ath.metab$map, significance=0.1)



