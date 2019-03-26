library(queuecomputer)


### Name: ql_summary
### Title: Summarise queue lengths
### Aliases: ql_summary

### ** Examples

n <- 1e3
arrivals <- cumsum(rexp(n))
service <- rexp(n)
departures <- queue(arrivals, service, 1)

queuedata <- queue_lengths(arrivals, service, departures)
ql_summary(queuedata$times, queuedata$queuelength)



