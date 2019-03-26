library(sybil)


### Name: findExchReact
### Title: Find Exchange Reactions
### Aliases: findExchReact

### ** Examples

  data(Ec_core)
  ex  <- findExchReact(Ec_core)
  
  # run FBA
  opt <- optimizeProb(Ec_core)
  
  # get flux distribution of exchange reactions
  getFluxDist(opt, ex)



