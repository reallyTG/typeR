library(simEd)


### Name: msq
### Title: Multiple-Server Queue Simulation
### Aliases: msq
### Keywords: utilities

### ** Examples

  # process 2000 arrivals, R-provided seed (via NULL seed), default 2 servers
  msq(2000, NULL)
  # process 2000 arrivals, seed 8675309, 3 servers, LFU server selection
  msq(2000, 8675309, 3, 'LFU') 

  msq(maxArrivals = 2000, seed = 8675309)
  msq(maxTime = 1000, seed = 8675309)

  ############################################################################
  # example to show use of seed = NA (default) to rely on current state of generator
  output1 <- msq(2000, 8675309, showOutput = FALSE, saveAllStats = TRUE)
  output2 <- msq(3000,          showOutput = FALSE, saveAllStats = TRUE)
  set.seed(8675309)
  output3 <- msq(2000,          showOutput = FALSE, saveAllStats = TRUE)
  output4 <- msq(3000,          showOutput = FALSE, saveAllStats = TRUE)
  sum(output1$sojournTimes != output3$sojournTimes) # should be zero
  sum(output2$sojournTimes != output4$sojournTimes) # should be zero

  ############################################################################
  # use same service function for (default) two servers
  myArrFcn <- function() { vexp(1, rate = 1/4, stream = 1) }               # mean is 4
  mySvcFcn <- function() { vgamma(1, shape = 1, rate = 0.3, stream = 2) }  # mean is 3.3
  output <- msq(maxArrivals = 2000, interarrivalFcn = myArrFcn, 
      serviceFcn = mySvcFcn, saveAllStats = TRUE)
  mean(output$interarrivalTimes)
  mean(output$serviceTimes)

  ############################################################################
  # use different service function for (default) two servers
  myArrFcn  <- function() { vexp(1, rate = 1/4, stream = 1) }                # mean is 4
  mySvcFcn1 <- function() { vgamma(1, shape = 3, scale = 1.1, stream = 2) }  # mean is 3.3
  mySvcFcn2 <- function() { vgamma(1, shape = 3, scale = 1.2, stream = 3) }  # mean is 3.6
  output <- msq(maxArrivals = 2000, interarrivalFcn = myArrFcn, 
      serviceFcn = list(mySvcFcn1, mySvcFcn2), saveAllStats = TRUE)
  mean(output$interarrivalTimes)
  meanTPS(output$numInQueueT, output$numInQueueN)  # compute time-averaged num in queue
  mean(output$serviceTimesPerServer[[1]])  # compute avg service time for server 1
  mean(output$serviceTimesPerServer[[2]])  # compute avg service time for server 2
  meanTPS(output$serverStatusT[[1]], output$serverStatusN[[1]])  # compute server 1 utilization
  meanTPS(output$serverStatusT[[2]], output$serverStatusN[[2]])  # compute server 2 utilization

  ############################################################################
  # example to show use of (simple) trace data for arrivals and service times,
  # allowing for reuse of trace data times
  smallQueueTrace <- list()
  smallQueueTrace$arrivalTimes <- c(15, 47, 71, 111, 123, 152, 166, 226, 310, 320)
  smallQueueTrace$serviceTimes <- c(43, 36, 34,  30,  38,  40,  31,  29,  36,  30) 

  interarrivalTimes <- NULL
  serviceTimes      <- NULL

  getInterarr <- function()
  {
      if (length(interarrivalTimes) == 0) { 
            interarrivalTimes <<- c(smallQueueTrace$arrivalTimes[1], 
                                    diff(smallQueueTrace$arrivalTimes))
      }   
      nextInterarr <- interarrivalTimes[1]
      interarrivalTimes <<- interarrivalTimes[-1] # remove 1st element globally
      return(nextInterarr)
  }

  getService <- function()
  {
      if (length(serviceTimes) == 0) { 
          serviceTimes <<- smallQueueTrace$serviceTimes
      }   
      nextService <- serviceTimes[1]
      serviceTimes <<- serviceTimes[-1]  # remove 1st element globally
      return(nextService)
  }

  output <- msq(maxArrivals = 100, numServers = 2, interarrivalFcn = getInterarr, 
                serviceFcn = getService, saveAllStats = TRUE)
  mean(output$interarrivalTimes)
  mean(output$serviceTimes)
  mean(output$serviceTimesPerServer[[1]])  # compute avg service time for server 1
  mean(output$serviceTimesPerServer[[2]])  # compute avg service time for server 2




