library(AUCRF)


### Name: AUCRF
### Title: Variable Selection with Random Forest and the Area Under the
###   Curve
### Aliases: AUCRF print.AUCRF summary.AUCRF exampleData fit

### ** Examples

   
  # load the included example dataset. This is a simulated case/control study  
  # data set with 4000 patients (2000 cases / 2000 controls) and 1000 SNPs, 
  # where the  first 10 SNPs have a direct association with the outcome:
  data(exampleData)
  
  # call AUCRF process: (it may take some time)
  # fit <- AUCRF(Y~., data=exampleData)
  
  # The result of this example is included for illustration purpose:
  
  data(fit)
  summary(fit)
  plot(fit)
  
  # Additional randomForest parameters can be included, otherwise default
  # parameters of randomForest function will be used:
  # fit <- AUCRF(Y~., data=exampleData, ntree=1000, nodesize=20)



