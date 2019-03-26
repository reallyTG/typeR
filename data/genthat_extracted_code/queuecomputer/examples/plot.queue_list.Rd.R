library(queuecomputer)


### Name: plot.queue_list
### Title: ggplot2 method for output from queueing model
### Aliases: plot.queue_list

### ** Examples

if(require(ggplot2, quietly = TRUE)){

n_customers <- 50
arrival_rate <- 1.8
service_rate <- 1
arrivals <- cumsum(rexp(n_customers, arrival_rate))
service <- rexp(n_customers, service_rate)
queue_obj <- queue_step(arrivals, service, servers = 2)
plot(queue_obj)

}

## Not run: 
##D 
##D library(ggplot2)
##D 
##D ## density plots of arrival and departure times
##D plot(queue_obj, which = 1)
##D 
##D ## histograms of arrival and departure times
##D plot(queue_obj, which = 2)
##D 
##D ## density plots of waiting and system times
##D plot(queue_obj, which = 3)
##D 
##D ## step function of queue length
##D plot(queue_obj, which = 4)
##D 
##D ## line range plot of customer and server status
##D plot(queue_obj, which = 5)
##D 
##D ## empirical distribution plot of arrival and departure times
##D plot(queue_obj, which = 6)
##D 
## End(Not run)




