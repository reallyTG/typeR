library(mbclusterwise)


### Name: cw.multiblock
### Title: Clusterwise multiblock analyses
### Aliases: cw.multiblock
### Keywords: multivariate cluster

### ** Examples

  data(simdata.red) 
  Data.X <- simdata.red[c(1:10, 21:30), 1:10]
  Data.Y <- simdata.red[c(1:10, 21:30), 11:13]
  ## Note that the options (INIT=2) and (parallel.level = "low") are chosen to quickly
  ## illustrate the function. 
  ## For real data, instead choose (INIT=20) to avoid local optima and (parallel.level = "high")
  ## to improve the computing speed.
  res.cw <- cw.multiblock(Y = Data.Y, X = Data.X, blo = c(5, 5), option = "none", G = 2, 
            H = 1, INIT = 2, method = "mbpcaiv", Gamma = NULL, parallel.level = "low")



