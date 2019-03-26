library(queuecomputer)


### Name: lag_step
### Title: Add lag to vector of arrival times.
### Aliases: lag_step

### ** Examples

# Create arrival times
arrivals <- rlnorm(100, meanlog = 3)

# Create service times
service <- rlnorm(100)
lag_step(arrivals = arrivals, service = service)

# lag_step is equivalent to queue_step with a large number of queues, but it's faster to compute.

cbind(queue(arrivals, service = service, servers = 100),
lag_step(arrivals = arrivals, service = service))



