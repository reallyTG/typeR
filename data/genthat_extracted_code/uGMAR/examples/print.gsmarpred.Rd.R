library(uGMAR)


### Name: print.gsmarpred
### Title: print method for class 'gsmarpred' objects
### Aliases: print.gsmarpred

### ** Examples

 ## No test: 
 # GMAR-model
 params12 <- c(1.12321, 0.90557, 0.29288, 4.53131,
               0.70309, 3.21154, 0.83888)
 gmar12 <- GSMAR(VIX, 1, 2, params12)
 pred <- predict(gmar12, n_ahead=10, plotRes=FALSE)
 pred
 print(pred, digits=3)
 
## End(No test)



