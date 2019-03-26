library(RTransProb)


### Name: transForecast_lda
### Title: Forecast - using Linear Discriminant Analysis
### Aliases: transForecast_lda

### ** Examples

## Not run: 
##D 
##D library(dplyr)
##D library(plyr)
##D library(Matrix)
##D 
##D 
##D for (i in c(24, 25, 26)) {
##D   data <- data
##D   
##D   histData <- histData.normz
##D   
##D   
##D   predData_lda2 <- predData_lda_Baseline
##D   predData_lda2 <- subset(
##D     predData_lda2,
##D     X == i,
##D     select = c(Market.Volatility.Index..Level..normz
##D 
##D     )
##D   )
##D   
##D   indVars   = c("Market.Volatility.Index..Level..normz"
##D 
##D   )
##D   
##D   
##D   
##D   startDate = "1991-08-16"
##D   endDate   = "2007-08-16"
##D   
##D   
##D   depVar <- c("end_rating")
##D   pct <- 1
##D   wgt <-  "mCount"
##D   ratingCat <- c("A", "B", "C", "D", "E", "F", "G")
##D   defind    <- "G"
##D   method    = "cohort"
##D   snapshots = 1
##D   interval  = 1
##D   
##D   
##D   lda_TM <-
##D     transForecast_lda(
##D       data,
##D       histData,
##D       predData_lda2,
##D       startDate,
##D       endDate,
##D       method,
##D       interval,
##D       snapshots,
##D       defind,
##D       depVar,
##D       indVars,
##D       pct,
##D       ratingCat
##D     )
##D   print(lda_TM)
##D   
##D }
##D 
## End(Not run)



