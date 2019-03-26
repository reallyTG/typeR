library(rrecsys)


### Name: getAUC
### Title: Returns the Area under the ROC curve.
### Aliases: getAUC getAUC,evalModel-method getAUC,evalModel

### ** Examples

  x <- matrix(sample(c(NA, 1:5), size = 200, replace = TRUE, 
        prob = c(.6,.8,.8,.8,.8,.8)), nrow = 20, byrow = TRUE)
  
  x <- defineData(x)
        
  e <- evalModel(x, 5)
  
  auc <- getAUC(e, "FunkSVD", k = 4) 
  
  auc         
  
  



