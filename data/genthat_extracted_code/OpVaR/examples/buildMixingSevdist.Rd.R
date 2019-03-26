library(OpVaR)


### Name: buildMixingSevdist
### Title: Building a dynamic mixture model as a sevdist object
### Aliases: buildMixingSevdist evaluate

### ** Examples

  # Create mixing sevdist object
  sevdist = buildMixingSevdist("weibull", c(2,6), "gpd", c(0,4,-0.5), c(8,.8))
  # Plot pdf
  plot(sevdist)



