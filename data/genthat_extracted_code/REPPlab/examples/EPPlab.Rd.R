library(REPPlab)


### Name: EPPlab
### Title: Function for Exploratory Projection Pursuit.
### Aliases: EPPlab

### ** Examples


  library(tourr)
  data(olive)
  olivePP <- EPPlab(olive[,3:10],PPalg="PSO",PPindex="KurtosisMax",n.simu=5, maxiter=20)
  summary(olivePP)

  library(amap)
  data(lubisch)
  X <- lubisch[1:70,2:7]
  rownames(X) <- lubisch[1:70,1]
  res <- EPPlab(X,PPalg="PSO",PPindex="FriedmanTukey",n.simu=15, maxiter=20,sphere=TRUE)
  print(res)
  summary(res)
  fitted(res)
  plot(res)
  pairs(res)
  predict(res,data=lubisch[71:74,2:7])




