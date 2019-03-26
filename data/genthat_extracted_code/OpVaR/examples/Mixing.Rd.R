library(OpVaR)


### Name: Mixing
### Title: Extended Dynamic Weighted Mixture Model
### Aliases: dmixing pmixing qmixing rmixing

### ** Examples

  ### Create mixing sevdist object
  sevdist=buildMixingSevdist("weibull", c(2,6), "gpd", c(0,4,-0.5), c(8,.8))
  ### Evaluate pdf
  dmixing(1,sevdist)



