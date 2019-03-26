library(HSAUR2)


### Name: voting
### Title: House of Representatives Voting Data
### Aliases: voting
### Keywords: datasets

### ** Examples


  data("voting", package = "HSAUR2")
  require("MASS")
  voting_mds <- isoMDS(voting)
  plot(voting_mds$points[,1], voting_mds$points[,2],
       type = "n", xlab = "Coordinate 1", ylab = "Coordinate 2",
       xlim = range(voting_mds$points[,1])*1.2)
  text(voting_mds$points[,1], voting_mds$points[,2], 
       labels = colnames(voting))
  voting_sh <- Shepard(voting[lower.tri(voting)], voting_mds$points)




