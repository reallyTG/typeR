library(queuecomputer)


### Name: queue_step
### Title: Compute the departure times and queue lengths for a queueing
###   system from arrival and service times.
### Aliases: queue_step

### ** Examples


# With two servers
set.seed(1)
n <- 100

arrivals <- cumsum(rexp(n, 3))
service <- rexp(n)


queue_obj <- queue_step(arrivals,
    service = service, servers = 2)


summary(queue_obj)
plot(queue_obj, which = 5)

# It seems like the customers have a long wait.
# Let's put two more servers on after time 20


server_list <- as.server.stepfun(c(20),c(2,4))

queue_obj2 <- queue_step(arrivals,
    service = service,
    servers = server_list)

summary(queue_obj2)
if(require(ggplot2, quietly = TRUE)){

    plot(queue_obj2, which = 5)

}





