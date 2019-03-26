library(RTransProb)


### Name: transForecast
### Title: Forecast - using Credit Cycle
### Aliases: transForecast

### ** Examples


#Use the function 'TransitionProb' to estimate an annualized transition matrix which will
#then be used along with the appropriate creditIndex to forecast future period migration
#effects.

## Not run: 
##D snapshots <- 4    #This uses quarterly transition matrices
##D interval <- 1    #This gives a 1 year transition matrix
##D startDate  <- "2000-01-01"
##D endDate    <- "2005-01-01"
##D Example9<-TransitionProb(data,startDate, endDate,'duration', period, snapshots, interval)
##D Example9.1 <- Example9$genMat
##D creditIndex <- -0.25
##D 
##D 
##D Example10 <- transForecast(Example9.1, isGenerator, creditIndex)
## End(Not run)




