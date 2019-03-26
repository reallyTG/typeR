library(ACDm)


### Name: plotLL
### Title: Plots the response surface of the log likelihood of a fitted
###   model.
### Aliases: plotLL

### ** Examples


## Not run: 
##D 
##D #Indicates identification issues with the generelized gamma distibution:
##D #(Try a diffrent 'startPara' in acdFit() to get slightly a better fit)
##D fitModel2 <- acdFit(durations = adjDurData[1:3000, ], dist = "gengamma")
##D seq1 <- seq(500, 1000, 50)
##D seq2 <- seq(.02, 0.045, 0.001)
##D plotLL(fitModel = fitModel2, parameter1 = "kappa", parameter2 = "gamma", 
##D        param1sequence = seq1, param2sequence = seq2)
## End(Not run)



