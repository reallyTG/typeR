library(ctl)


### Name: ctl.circle
### Title: Circleplot CTL on multiple traits
### Aliases: ctl.circle
### Keywords: hplot

### ** Examples

  library(ctl)
  data(ath.result)       # Arabidopsis Thaliana results
  data(ath.metabolites)  # Arabidopsis Thaliana data set

  ctl.circle(ath.result, ath.metab$map, sign=0.001)
  ctl.circle(ath.result, ath.metab$map, phenocol = 1:6, sign = 0.01)



