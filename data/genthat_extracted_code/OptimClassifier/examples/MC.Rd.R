library(OptimClassifier)


### Name: MC
### Title: Confusion Matrix
### Aliases: MC

### ** Examples


if(interactive()){
 # You can create a confusion Matrix like a table

 RealValue <- c(1,0,1,0)
 Predicted <- c(1,1,1,0)

 MC(y = RealValue, yhat=Predicted ,metrics=TRUE)


}



