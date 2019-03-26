library(distr)


### Name: makeAbscontDistribution
### Title: "makeAbscontDistribution"
### Aliases: makeAbscontDistribution
### Keywords: distribution

### ** Examples

  Hu <- Huberize(Norm(), -2,1)
  Hu
  plot(Hu)
  Hu0 <- makeAbscontDistribution(Hu)
  Hu0
  plot(Hu0)



