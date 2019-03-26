library(queuecomputer)


### Name: print.summary_queue_list
### Title: Print method for output of 'summary.queue_list'.
### Aliases: print.summary_queue_list

### ** Examples

n <- 1e3
arrivals <- cumsum(rexp(n, 1.8))
service <- rexp(n)

queue_obj <- queue_step(arrivals, service, servers = 2)
summary(queue_obj)



