library(rrecsys)


### Name: evalRec
### Title: Evaluates the requested recommendation algorithm.
### Aliases: evalRec evalRec,evalModel-method evalRec,evalModel,list-method

### ** Examples

  x <- matrix(sample(c(0:5), size = 200, replace = TRUE, 
        prob = c(.6,.8,.8,.8,.8,.8)), nrow = 20, byrow = TRUE)
  
  x <- defineData(x)
        
  e <- evalModel(x, 2)
  
  SVDEvaluation <- evalRec(e, "FunkSVD", positiveThreshold = 4, k = 4) 
  
  SVDEvaluation         
  
  
  



