library(sybil)


### Name: shrinkMatrix-methods
### Title: Get a Subset of Matrix Like Objects
### Aliases: shrinkMatrix shrinkMatrix-methods shrinkMatrix,modelorg-method
### Keywords: methods

### ** Examples

  # get the part of the stoichiometric containing
  # the exchange reactions
  data(Ec_core)
  ex <- findExchReact(Ec_core)
  shrinkMatrix(Ec_core, j = ex)



