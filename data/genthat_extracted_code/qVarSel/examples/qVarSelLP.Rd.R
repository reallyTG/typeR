library(qVarSel)


### Name: qVarSelLP
### Title: A Mixed Integer Linear Programming Formulation for the Variable
###   Selection Problem
### Aliases: qVarSelLP
### Keywords: classif cluster optimize

### ** Examples

 ## Generate random cluster
  
  a <- rbind(cbind(rnorm(5, 0, 1), rnorm(5, 0, 3), rnorm(5, 0, 5)), 
            cbind(rnorm(5, 5, 1), rnorm(5, 5, 3), rnorm(5, 5, 5) ))
            
  ## calculate data prototypes using k-means

  sl2 <- kmeans(a, 2, iter.max = 100, nstart = 2)
  p = sl2$centers
  
  ## calculate distances between observations and prototypes
  ## Remark: d is a 3-dimensions matrix

  d = PrtDist(a, p)
  
  ## Select 2 most representative variables, use heuristic  
  
  lsH <- qVarSelH(d, 2, maxit = 200)

  ## Select 2 variables, use linear relaxation
  
  require(lpSolveAPI)
  lsC <- qVarSelLP(d, 2)
  
  
  ## check optimality
  
  if (abs(lsH$obj - lsC$obj) < 0.001)
      message = "Heuristic Solution is Optimal"



