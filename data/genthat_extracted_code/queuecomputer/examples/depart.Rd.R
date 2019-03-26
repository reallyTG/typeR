library(queuecomputer)


### Name: depart
### Title: get departure times from 'queue_list' object
### Aliases: depart

### ** Examples

arrivals <- cumsum(rexp(10))
service <- rexp(10)
queue_obj <- queue_step(arrivals, service)

depart(queue_obj)
queue_obj$departures_df$departures



