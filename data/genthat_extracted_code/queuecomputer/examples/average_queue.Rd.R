library(queuecomputer)


### Name: average_queue
### Title: Compute time average queue length
### Aliases: average_queue

### ** Examples

n <- 1e3
arrivals <- cumsum(rexp(n))
service <- rexp(n)
departures <- queue(arrivals, service, 1)

queuedata <- queue_lengths(arrivals, service, departures)
average_queue(queuedata$times, queuedata$queuelength)



