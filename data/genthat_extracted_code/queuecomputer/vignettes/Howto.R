## ------------------------------------------------------------------------
library(queuecomputer)
library(dplyr)

arrivals <- cumsum(rexp(100))

head(arrivals)

service <- rexp(100)

departures <- queue_step(arrivals = arrivals, service = service)

print(departures, n = 6)

## ------------------------------------------------------------------------
# Zero servers available before time 10
# One server available between time 10 and time 50
# Three servers available between time 50 and time 100
# One server available from time 100 onwards
resource_schedule <- as.server.stepfun(c(10,50,100), c(0, 1, 3, 1))

resource_schedule

departures <- queue_step(arrivals = arrivals, service = service, servers = resource_schedule)

print(departures, n = 6)

## ------------------------------------------------------------------------
# Server 1 is available before time 10.
# Server 2 is available between time 15 and time 30.
# Server 3 is available after time 10. 
as.server.list(list(10, c(15,30), 10), c(1,0,0))

## ------------------------------------------------------------------------
library(queuecomputer)
library(dplyr)

set.seed(500)

n <- 100

arrivals <- cumsum(rexp(n))
service_l <- rexp(n, 0.8)
service_q <- rexp(n, 0.5)
arrivals_b <- cumsum(rexp(n, 0.8))

# The queue elements can be computed one by one. 

departures_1 <- lag_step(arrivals, service_l)
departures_2 <- queue(departures_1, service = service_q, servers = 2)
departures_3 <- wait_step(departures_2, arrivals_b)

# Or the queue elements can be chained together with the %>% operator. 

departures <- lag_step(arrivals, service_l) %>% queue_step(service = service_q, servers = 2) %>% wait_step(arrivals_b)

all(departures == departures_3)

# Plot densities for this tandem queueing network

colours <- rainbow(4)
plot(density(arrivals, from = 0), 
  col = colours[1], xlim = c(0, 220), ylim = c(0, 0.015), 
  main = "Density plot")
lines(density(departures_1, from = 0), col = colours[2])
lines(density(departures_2, from = 0), col = colours[3])
lines(density(departures_3, from = 0), col = colours[4])
legend(150,0.012, legend = c("Start walk",
    "Finish walk",
    "Finish service", 
    "Pick up bag"),
    col = colours, lwd = 1, cex = 0.8
)




