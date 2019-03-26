library(OpVaR)


### Name: buildPlainSevdist
### Title: Building a sevdist object with a plain distribution
### Aliases: buildPlainSevdist

### ** Examples

  # Log-gamma distributed severity with shape = 2.2 and rate = 1.2
  
  sevdist1 = buildPlainSevdist("lgamma", c(2.2, 1.2))
  plot(sevdist1)



