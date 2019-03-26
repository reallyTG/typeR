library(mbclusterwise)


### Name: mbclusterwise-package
### Title: Clusterwise Multiblock Analyses
### Aliases: mbclusterwise-package mbclusterwise
### Keywords: multivariate cluster

### ** Examples

  data(simdata.red) 
  Data.X <- simdata.red[c(1:10, 21:30), 1:10]
  Data.Y <- simdata.red[c(1:10, 21:30), 11:13]
  ## Note that the options (INIT=2) and (parallel.level = "low") are chosen to quickly
  ## illustrate the function. 
  ## For real data, instead choose (INIT=20) to avoid local optima and (parallel.level = "high")
  ## to improve the computing speed. 
  res.cw <- cw.multiblock(Y = Data.Y, X = Data.X, blo = c(5, 5), option = "none", G = 2, H = 1, 
            INIT = 2, method = "mbpls", Gamma = NULL, parallel.level = "low")



