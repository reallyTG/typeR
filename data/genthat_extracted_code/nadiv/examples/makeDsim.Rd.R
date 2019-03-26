library(nadiv)


### Name: makeDsim
### Title: Create the dominance genetic relationship matrix through an
###   iterative (simulation) process
### Aliases: makeDsim makeSdsim makeSdsim makeDsim

### ** Examples


  simD <- makeDsim(Mrode9, N = 1000, parallel = FALSE,
		invertD = TRUE, calcSE = TRUE)$listDsim

  simSd <- makeSdsim(FG90, heterogametic = "0", N = 1000, parallel = FALSE,
		invertSd = TRUE, calcSE = TRUE)$listSdsim



