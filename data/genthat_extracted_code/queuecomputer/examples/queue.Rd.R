library(queuecomputer)


### Name: queue
### Title: Compute the departure times for a set of customers in a queue
###   from their arrival and service times.
### Aliases: queue

### ** Examples

n <- 1e2
arrivals <- cumsum(rexp(n, 1.8))
service <- rexp(n)

departures <- queue(
    arrivals, service, servers = 2)

head(departures)
curve(ecdf(departures)(x) * n,
    from = 0, to = max(departures),
    xlab = "Time", ylab = "Number of customers")
curve(ecdf(arrivals)(x) * n,
    from = 0, to = max(departures),
    col = "red", add = TRUE)




