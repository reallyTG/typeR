library(RTransProb)


### Name: transForecast_ann
### Title: Forecast - using Artificial Neural Networks
### Aliases: transForecast_ann

### ** Examples

## Not run: 
##D library(dplyr)
##D library(plyr)
##D library(Matrix)
##D 
##D 
##D for (i in c(24,25,26)) {
##D  tic()
##D  data <- data
##D  
##D  histData <- histData.normz
##D 
##D  predData_ann2 <- predData_ann_Baseline
##D  predData_ann2 <- subset(
##D    predData_ann2,
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
##D  
##D  depVar <- c("end_rating")
##D  
##D  pct <- 1
##D  wgt <-  "mCount"
##D  ratingCat <- c("A", "B", "C", "D", "E", "F", "G")
##D  defind    <- "G"
##D  
##D  
##D  ratingCat <- as.numeric(factor(
##D    ratingCat,
##D    levels = c('A', 'B', 'C', 'D', 'E', 'F', 'G'),
##D    labels = c(1, 2, 3, 4, 5, 6, 7)
##D  ))
##D  
##D  defind <- as.numeric(factor(
##D    defind,
##D    levels = c('A', 'B', 'C', 'D', 'E', 'F', 'G'),
##D    labels = c(1, 2, 3, 4, 5, 6, 7)
##D  ))
##D  
##D  method    = "cohort"
##D  snapshots = 1
##D  interval  = 1
##D  hiddenlayers = c(1)
##D  activation = "logistic"
##D  stepMax = 1e9                #increase to make sure the DNN converges
##D  calibration = "FALSE"
##D  rept = 1
##D  
##D  ann_TM <-
##D    transForecast_ann(
##D      data,
##D      histData,
##D      predData_ann2,
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
##D      hiddenlayers,
##D      activation,
##D      stepMax,
##D      rept,
##D      calibration
##D    )
##D  print(ann_TM)
##D  
##D  toc()
##D }
## End(Not run)



