library(RTransProb)


### Name: transForecast_mnl
### Title: Forecast - using Multinomial Logistic Regression
### Aliases: transForecast_mnl

### ** Examples

## Not run: 
##D 
##D library(dplyr)
##D library(plyr)
##D library(Matrix)
##D 
##D 
##D 
##D 
##D for (i in c(24, 25, 26)) {
##D   data <- data
##D   
##D   attach(data)
##D   data2 <- data[order(ID, Date),] 
##D   detach(data)
##D   
##D   data <- data2
##D   rm(data2)
##D   
##D   
##D   histData <- histData
##D   
##D   
##D   predData_mnl2 <- predData_mnl_Baseline
##D   predData_mnl2 <- subset(
##D     predData_mnl,
##D     X == i,
##D     select = c(Market.Volatility.Index..Level.,
##D                D_B,
##D                D_C,
##D                D_D,
##D                D_E,
##D                D_F,
##D                D_G
##D     )
##D   )
##D   
##D   indVars   = c("Market.Volatility.Index..Level."
##D 
##D   )
##D   
##D   
##D   startDate = "1991-08-16"
##D   endDate   = "2007-08-16"
##D   method    = "cohort"
##D   snapshots = 1
##D   interval  = 1
##D   ref       = 'A'
##D   depVar    = c("end_rating")
##D   ratingCat = c("A", "B", "C", "D", "E", "F", "G", "N")
##D   defind    = "N"
##D   wgt       = "mCount"
##D   
##D   
##D   
##D   transForecast_mnl_out <-
##D     transForecast_mnl(
##D       data,
##D       histData,
##D       predData_mnl2,
##D       startDate,
##D       endDate,
##D       method,
##D       interval,
##D       snapshots,
##D       defind,
##D       ref,
##D       depVar,
##D       indVars,
##D       ratingCat,
##D       wgt
##D     )
##D   output <- transForecast_mnl_out$mnl_Predict
##D   print(output)
##D   
##D }
##D 
## End(Not run)
  



