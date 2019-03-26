library(cpm)


### Name: getStatistics
### Title: Returns the Test Statistics Associated With A CPM S4 Object
### Aliases: getStatistics

### ** Examples

#generate a sequence containing two change points
x <- c(rnorm(200,0,1),rnorm(200,1,1),rnorm(200,0,1))

#vectors to hold the result
detectiontimes <- numeric()
changepoints <- numeric()

#use a Lepage CPM
cpm <- makeChangePointModel(cpmType="Lepage", ARL0=500)


i <- 0
while (i < length(x)) {
  i <- i + 1
  #process each observation in turn
  cpm <- processObservation(cpm,x[i])
  
  #if a change has been found, log it, and reset the CPM
  if (changeDetected(cpm) == TRUE) {
    print(sprintf("Change detected at observation %d", i))
    detectiontimes <- c(detectiontimes,i)
    
    #the change point estimate is the maximum D_kt statistic 
    Ds <- getStatistics(cpm)
    tau <- which.max(Ds)
    
    if (length(changepoints) > 0) {
      tau <- tau + changepoints[length(changepoints)]
    }
    changepoints <- c(changepoints,tau)
    
    #reset the CPM
    cpm <- cpmReset(cpm)
    
    #resume monitoring from the observation following the 
    #change point
    i <- tau
  }
}



