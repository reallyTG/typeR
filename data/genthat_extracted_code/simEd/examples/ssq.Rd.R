library(simEd)


### Name: ssq
### Title: Single-Server Queue Simulation
### Aliases: ssq
### Keywords: utilities

### ** Examples

  # process 2000 arrivals, R-provided seed (via NULL seed)
  ssq(2000, NULL)

  ssq(maxArrivals = 2000, seed = 54321)
  ssq(maxDepartures = 2000, seed = 54321)
  ssq(maxTime = 1000, seed = 54321)

  ############################################################################
  # example to show use of seed = NA (default) to rely on current state of generator
  output1 <- ssq(2000, 8675309, showOutput = FALSE, saveAllStats = TRUE)
  output2 <- ssq(3000,          showOutput = FALSE, saveAllStats = TRUE)
  set.seed(8675309)
  output3 <- ssq(2000,          showOutput = FALSE, saveAllStats = TRUE)
  output4 <- ssq(3000,          showOutput = FALSE, saveAllStats = TRUE)
  sum(output1$sojournTimes != output3$sojournTimes) # should be zero
  sum(output2$sojournTimes != output4$sojournTimes) # should be zero

  myArrFcn <- function() { vexp(1, rate = 1/4, stream = 1)  }  # mean is 4
  mySvcFcn <- function() { vgamma(1, shape = 1, rate = 0.3) }  # mean is 3.3

  output <- ssq(maxArrivals = 1000, interarrivalFcn = myArrFcn, serviceFcn = mySvcFcn, 
               saveAllStats = TRUE)
  mean(output$interarrivalTimes)
  mean(output$serviceTimes)
  meanTPS(output$numInQueueT, output$numInQueueN) # compute time-averaged num in queue
  meanTPS(output$serverStatusT, output$serverStatusN) # compute server utilization

  ############################################################################
  # example to show use of (simple) trace data for arrivals and service times;
  # ssq() will need one more interarrival (arrival) time than jobs processed
  #
  initTimes <- function()
  {
      arrivalTimes      <<- c(15, 47, 71, 111, 123, 152, 232, 245, 99999)
      interarrivalTimes <<- c(arrivalTimes[1], diff(arrivalTimes))
      serviceTimes      <<- c(43, 36, 34, 30, 38, 30, 31, 29)
  }

  getInterarr <- function()
  {
      nextInterarr <- interarrivalTimes[1]
      interarrivalTimes <<- interarrivalTimes[-1] # remove 1st element globally
      return(nextInterarr)
  }

  getService <- function()
  {
      nextService <- serviceTimes[1]
      serviceTimes <<- serviceTimes[-1]  # remove 1st element globally
      return(nextService)
  }

  initTimes()
  numJobs <- length(serviceTimes)
  output <- ssq(maxArrivals = numJobs, interarrivalFcn = getInterarr, 
                serviceFcn = getService, saveAllStats = TRUE)
  mean(output$interarrivalTimes)
  mean(output$serviceTimes)


  ############################################################################
  # example to show use of (simple) trace data for arrivals and service times,
  # allowing for reuse (recycling) of trace data times

  initArrivalTimes <- function()
  {
      arrivalTimes      <<- c(15, 47, 71, 111, 123, 152, 232, 245)
      interarrivalTimes <<- c(arrivalTimes[1], diff(arrivalTimes))
  }

  initServiceTimes <- function()
  {
      serviceTimes      <<- c(43, 36, 34, 30, 38, 30, 31, 29)
  }

  getInterarr <- function()
  {
      if (length(interarrivalTimes) == 0)  initArrivalTimes()

      nextInterarr <- interarrivalTimes[1]
      interarrivalTimes <<- interarrivalTimes[-1] # remove 1st element globally
      return(nextInterarr)
  }

  getService <- function()
  {
      if (length(serviceTimes) == 0)  initServiceTimes()

      nextService <- serviceTimes[1]
      serviceTimes <<- serviceTimes[-1]  # remove 1st element globally
      return(nextService)
  }

  initArrivalTimes()
  initServiceTimes()
  output <- ssq(maxArrivals = 100, interarrivalFcn = getInterarr, 
                serviceFcn = getService, saveAllStats = TRUE)
  mean(output$interarrivalTimes)
  mean(output$serviceTimes)



