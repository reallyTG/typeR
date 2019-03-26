library(mbclusterwise)


### Name: cw.predict
### Title: Prediction procedure for clusterwise multiblock analyses
### Aliases: cw.predict
### Keywords: multivariate cluster

### ** Examples
 
  data(simdata.red) 
  Data.X      <- simdata.red[c(1:10, 21:30), 1:10]
  Data.Y      <- simdata.red[c(1:10, 21:30), 11:13]
  Data.X.test <- simdata.red[c(16:20, 36:40), 1:10]
  ## Note that the options (INIT=2) and (parallel.level = "low") are chosen to quickly
  ## illustrate the function. 
  ## For real data, instead choose (INIT=20) to avoid local optima and (parallel.level = "high")
  ## to improve the computing speed.
  res.cw      <- cw.multiblock(Y = Data.Y, X = Data.X, blo = c(5, 5), option = "none", G = 2,
                  H = 1, INIT = 2, method = "mbpls", Gamma = NULL, parallel.level = "low")
  rescw.pred  <- cw.predict(Data.X.test, res.cw)



