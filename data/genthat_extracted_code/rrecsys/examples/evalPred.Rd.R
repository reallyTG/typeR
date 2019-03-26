library(rrecsys)


### Name: evalPred
### Title: Evaluates the requested prediction algorithm.
### Aliases: evalPred evalPred,evalModel-method
###   evalPred,evalModel,list-method

### ** Examples

    x <- matrix(sample(c(0:5), size = 200, replace = TRUE, 
        prob = c(.6,.8,.8,.8,.8,.8)), nrow = 20, byrow = TRUE)
  
  x <- defineData(x)
        
  e <- evalModel(x, 2)
  
  SVDEvaluation <- evalPred(e, "FunkSVD", k = 4) 
  
  SVDEvaluation         
  
  
  IBEvaluation <- evalPred(e, "IBKNN", simFunct = "cos", neigh = 5, coRatedThreshold = 2)
  
  IBEvaluation
  



