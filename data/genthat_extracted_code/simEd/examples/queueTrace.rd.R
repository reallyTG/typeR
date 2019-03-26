library(simEd)


### Name: queueTrace
### Title: Trace Data for Single-Server Queue Simulation
### Aliases: queueTrace
### Keywords: datasets

### ** Examples

  data(queueTrace)
  interarrivalTimes   <- c(queueTrace$arrivalTimes[1], diff(queueTrace$arrivalTimes))
  serviceTimes        <- queueTrace$serviceTimes

  avgInterarrivalTime <- mean(interarrivalTimes)
  avgServiceTime      <- mean(serviceTimes)

  # functions to use this trace data for the ssq() function;
  # note that the functions below destroy the global values of the copied 
  # interarrivalTimes and serviceTimes vectors along the way...
  #
  interarrivalTimes <- NULL
  serviceTimes      <- NULL
  getInterarr <- function()
  {
      if (length(interarrivalTimes) == 0) { 
            interarrivalTimes <<- c(queueTrace$arrivalTimes[1], 
                                    diff(queueTrace$arrivalTimes))
      }
      nextInterarr <- interarrivalTimes[1]
      interarrivalTimes <<- interarrivalTimes[-1] # remove 1st element globally
      return(nextInterarr)
  }
  getService <- function()
  {
      if (length(serviceTimes) == 0) { 
          serviceTimes <<- queueTrace$serviceTimes
      }
      nextService <- serviceTimes[1]
      serviceTimes <<- serviceTimes[-1]  # remove 1st element globally
      return(nextService)
  }
  ssq(maxArrivals = 1000, interarrivalFcn = getInterarr, serviceFcn = getService)



