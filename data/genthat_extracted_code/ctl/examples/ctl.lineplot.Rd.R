library(ctl)


### Name: ctl.lineplot
### Title: Lineplot CTL on multiple traits
### Aliases: ctl.lineplot
### Keywords: hplot

### ** Examples

  require(ctl)
  data(ath.result)       # Arabidopsis Thaliana results
  data(ath.metabolites)  # Arabidopsis Thaliana data set

  todo <- c(1,3,4,5,6,8,9,10,11,12,14,17,18,19,22,23)
  op   <- par(mfrow = c(4,4))
  op   <- par(oma = c(0.1,0.1,0.1,0.1))
  op   <- par(mai = c(0.1,0.1,0.1,0.1))
  for(x in todo){ # Overview of the 16 traits with CTLs
    ctl.lineplot(ath.result, ath.metab$map, phenocol = x, sign=0.1)
  }



