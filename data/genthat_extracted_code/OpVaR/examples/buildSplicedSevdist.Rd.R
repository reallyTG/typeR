library(OpVaR)


### Name: buildSplicedSevdist
### Title: Building a sevdist object with a spliced distribution
### Aliases: buildSplicedSevdist

### ** Examples

  # Spliced distributed severity with gamma distributed body with shape = 1.23, rate = 0.12 
  # and GPD distributed tail with shape = 716 and scale = 0.1 and threshold = 2000. 
  # The weight for the body is 0.8.
  
  sevdist1 = buildSplicedSevdist("gamma", c(2.5, 0.012), "gpd", c(2000, 716, 0.1), 2000, 0.8)
  plot(sevdist1)



