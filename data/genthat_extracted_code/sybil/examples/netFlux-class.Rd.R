library(sybil)


### Name: netFlux-class
### Title: Class '"netFlux"'
### Aliases: netFlux netFlux-class getNetFlux length,netFlux-method
###   rate,netFlux-method rate react_id,netFlux-method
###   react_id<-,netFlux-method
### Keywords: classes

### ** Examples

  data(Ec_core)
  # retrieve all exchange reactions
  ex  <- findExchReact(Ec_core)
  # perform flux balance analysis
  opt <- optimizeProb(Ec_core, algorithm = "fba")
  # get flux distribution of all exchange reactions
  fd  <- getFluxDist(opt, ex)
  # group exchange reactions
  getNetFlux(fd)



