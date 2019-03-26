library(samon)


### Name: samonevalIM
### Title: Evaluates the loss function at a range of smoothing parameters
### Aliases: samonevalIM

### ** Examples

  data("VAS1")

  ## inputation moddel.
  NT                <- ncol(VAS1)
  inmodel           <- matrix(1,NT,6)
  inmodel[1,]       <- 0
  inmodel[NT,]      <- 0
  inmodel[NT-1,4:6] <- 0

  ## outcome loss function
  F1 <- samonevalIM( mat = VAS1, Npart = 10,
           sigmaList = seq(1,10,by=1),
           inmodel = inmodel,
           seed = 26,
           type = "F" )



