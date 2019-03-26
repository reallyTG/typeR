library(RTransProb)


### Name: transForecast_svm
### Title: Forecast - using Support Vector Machines
### Aliases: transForecast_svm

### ** Examples

## Not run: 
##D library(dplyr)
##D library(plyr)
##D library(Matrix)
##D library(tictoc)
##D 
##D 
##D 
##D for (i in c(24, 25, 26)) {
##D  print(paste("RUN-",i,sep=""))
##D  data <- data
##D  
##D  histData <- histData.normz
##D  
##D  
##D  predData_svm2 <- predData_svm_Baseline
##D  predData_svm2 <- subset(
##D    predData_svm2,
##D    X == i,
##D    select = c(Market.Volatility.Index..Level..normz
##D 
##D    )
##D  )
##D  
##D  indVars   = c("Market.Volatility.Index..Level..normz"
##D 
##D  )
##D  
##D  
##D  startDate = "1991-08-16"
##D  endDate   = "2007-08-16"
##D  
##D  depVar <- c("end_rating")
##D  
##D  pct <- 1
##D  wgt <-  "mCount"
##D  ratingCat <- c("A", "B", "C", "D", "E", "F", "G")
##D  defind    <- "G"
##D  lstCategoricalVars <- c("end_rating")
##D  tuning <- "FALSE"
##D  cost <- 0.01
##D  gamma <- 0.01
##D  cost.weights <-  c(0.01, 0.05, 0.1, 0.25, 10, 50, 100)
##D  gamma.weights <- c(0.01, 0.05, 0.1, 0.25, 10, 50, 100)
##D  kernelType <- "sigmoid"
##D  method    = "cohort"
##D  snapshots = 1
##D  interval  = 1
##D  
##D  
##D  svm_TM <-
##D    transForecast_svm(
##D      data,
##D      histData,
##D      predData_svm2,
##D      startDate,
##D      endDate,
##D      method,
##D      interval,
##D      snapshots,
##D      defind,
##D      depVar,
##D      indVars,
##D      ratingCat,
##D      pct,
##D      tuning,
##D      kernelType,
##D      cost,
##D      cost.weights,
##D      gamma,
##D      gamma.weights
##D    )
##D  print(svm_TM)
##D  
##D }
## End(Not run)



