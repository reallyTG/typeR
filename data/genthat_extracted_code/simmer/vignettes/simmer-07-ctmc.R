## ---- cache = FALSE, include=FALSE---------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>",
                      fig.width = 6, fig.height = 4, fig.align = "center")

required <- c("simmer.plot")

if (!all(sapply(required, requireNamespace, quietly = TRUE)))
  knitr::opts_chunk$set(eval = FALSE)

## ---- message=FALSE------------------------------------------------------
library(simmer)
library(simmer.plot)
set.seed(1234)

## ------------------------------------------------------------------------
# Arrival rate
lambda <- 3/20
# Service rate (cars, motorcycles)
mu <- c(1/8, 1/3)
# Probability of car
p <- 0.75

# Theoretical resolution
A <- matrix(c(1,   mu[1],            0,
              1, -lambda, (1-p)*lambda,
              1,   mu[2],       -mu[2]), byrow=T, ncol=3)
B <- c(1, 0, 0)
P <- solve(t(A), B)
N_average_theor <- sum(P * c(1, 0, 1)) ; N_average_theor

## ------------------------------------------------------------------------
option.1 <- function(t) {
  car <- trajectory() %>%
    seize("pump", amount=1) %>%
    timeout(function() rexp(1, mu[1])) %>%
    release("pump", amount=1)
  
  mcycle <- trajectory() %>%
    seize("pump", amount=1) %>%
    timeout(function() rexp(1, mu[2])) %>%
    release("pump", amount=1)
  
  simmer() %>%
    add_resource("pump", capacity=1, queue_size=0) %>%
    add_generator("car", car, function() rexp(1, p*lambda)) %>%
    add_generator("mcycle", mcycle, function() rexp(1, (1-p)*lambda)) %>%
    run(until=t)
}

## ------------------------------------------------------------------------
option.2 <- function(t) {
  vehicle <- trajectory() %>%
    seize("pump", amount=1) %>%
    branch(function() sample(c(1, 2), 1, prob=c(p, 1-p)), c(T, T), 
           trajectory("car") %>%
             timeout(function() rexp(1, mu[1])),
           trajectory("mcycle") %>%
             timeout(function() rexp(1, mu[2]))) %>%
    release("pump", amount=1)
  
  simmer() %>%
    add_resource("pump", capacity=1, queue_size=0) %>%
    add_generator("vehicle", vehicle, function() rexp(1, lambda)) %>%
    run(until=t)
}

## ------------------------------------------------------------------------
option.3 <- function(t) {
  vehicle <- trajectory() %>%
    seize("pump", amount=1) %>%
    timeout(function() {
      if (runif(1) < p) rexp(1, mu[1])  # car
      else rexp(1, mu[2])               # mcycle
    }) %>%
    release("pump", amount=1)
  
  simmer() %>%
    add_resource("pump", capacity=1, queue_size=0) %>%
    add_generator("vehicle", vehicle, function() rexp(1, lambda)) %>%
    run(until=t)
}

## ------------------------------------------------------------------------
gas.station <- option.3(5000)

# Evolution + theoretical value
plot(get_mon_resources(gas.station), "usage", "pump", items="system") +
  geom_hline(yintercept=N_average_theor)

## ---- eval=FALSE---------------------------------------------------------
#  library(microbenchmark)
#  
#  t <- 1000/lambda
#  tm <- microbenchmark(option.1(t),
#                       option.2(t),
#                       option.3(t))
#  autoplot(tm) +
#    scale_y_log10(breaks=function(limits) pretty(limits, 5)) +
#    ylab("Time [milliseconds]")

## ------------------------------------------------------------------------
# Theoretical resolution
A <- matrix(c(1,                   0,       0,               mu[1],            0,
              1, -(1-p)*lambda-mu[1],   mu[1],                   0,            0,
              1,            p*lambda, -lambda,        (1-p)*lambda,            0,
              1,                   0,   mu[2], -(1-p)*lambda-mu[2], (1-p)*lambda,
              1,                   0,       0,               mu[2],       -mu[2]), 
            byrow=T, ncol=5)
B <- c(1, 0, 0, 0, 0)
P <- solve(t(A), B)
N_average_theor <- sum(P * c(2, 1, 0, 1, 2)) ; N_average_theor

## ------------------------------------------------------------------------
option.1 <- function(t) {
  car <- trajectory() %>%
    seize("pump", amount=function() {
      if (env %>% get_server_count("pump")) 2  # rejection
      else 1                                   # serve
    }) %>%
    timeout(function() rexp(1, mu[1])) %>%
    release("pump", amount=1)
  
  mcycle <- trajectory() %>%
    seize("pump", amount=1) %>%
    timeout(function() rexp(1, mu[2])) %>%
    release("pump", amount=1)
  
  env <- simmer() %>%
    add_resource("pump", capacity=1, queue_size=1) %>%
    add_generator("car", car, function() rexp(1, p*lambda)) %>%
    add_generator("mcycle", mcycle, function() rexp(1, (1-p)*lambda))
  env %>% run(until=t)
}

## ------------------------------------------------------------------------
option.2 <- function(t) {
  vehicle <- trajectory() %>%
    branch(function() sample(c(1, 2), 1, prob=c(p, 1-p)), c(F, F), 
           trajectory("car") %>%
             seize("pump", amount=function() {
               if (env %>% get_server_count("pump")) 2  # rejection
               else 1                                   # serve
             }) %>%
             timeout(function() rexp(1, mu[1])) %>%
             release("pump", amount=1),                 # always 1
           trajectory("mcycle") %>%
             seize("pump", amount=1) %>%
             timeout(function() rexp(1, mu[2])) %>%
             release("pump", amount=1))
  
  env <- simmer() %>%
    add_resource("pump", capacity=1, queue_size=1) %>%
    add_generator("vehicle", vehicle, function() rexp(1, lambda))
  env %>% run(until=t)
}

## ------------------------------------------------------------------------
option.3 <- function(t) {
  vehicle <- trajectory("car") %>%
    set_attribute("vehicle", function() sample(c(1, 2), 1, prob=c(p, 1-p))) %>%
    seize("pump", amount=function() {
      if (get_attribute(env, "vehicle") == 1 &&
          env %>% get_server_count("pump")) 2    # car rejection
      else 1                                     # serve
    }) %>%
    timeout(function() rexp(1, mu[get_attribute(env, "vehicle")])) %>%
    release("pump", amount=1)                    # always 1
  
  env <- simmer() %>%
    add_resource("pump", capacity=1, queue_size=1) %>%
    add_generator("vehicle", vehicle, function() rexp(1, lambda))
  env %>% run(until=t)
}

## ------------------------------------------------------------------------
option.4 <- function(t) {
  vehicle <- trajectory() %>%
    branch(function() sample(c(1, 2), 1, prob=c(p, 1-p)), c(F, F), 
           trajectory("car") %>%
             seize("pump", amount=3) %>%
             timeout(function() rexp(1, mu[1])) %>%
             release("pump", amount=3),
           trajectory("mcycle") %>%
             seize("pump", amount=2) %>%
             timeout(function() rexp(1, mu[2])) %>%
             release("pump", amount=2))
  
  simmer() %>%
    add_resource("pump", capacity=3, queue_size=2) %>%
    add_generator("vehicle", vehicle, function() rexp(1, lambda)) %>%
    run(until=t)
}

## ------------------------------------------------------------------------
option.5 <- function(t) {
  car <- trajectory() %>%
    seize("pump", amount=3) %>%
    timeout(function() rexp(1, mu[1])) %>%
    release("pump", amount=3)
  
  mcycle <- trajectory() %>%
    seize("pump", amount=2) %>%
    timeout(function() rexp(1, mu[2])) %>%
    release("pump", amount=2)
  
  simmer() %>%
    add_resource("pump", capacity=3, queue_size=2) %>%
    add_generator("car", car, function() rexp(1, p*lambda)) %>%
    add_generator("mcycle", mcycle, function() rexp(1, (1-p)*lambda)) %>%
    run(until=t)
}

## ------------------------------------------------------------------------
gas.station <- option.1(5000)

# Evolution + theoretical value
plot(get_mon_resources(gas.station), "usage", "pump", items="system") + 
  geom_hline(yintercept=N_average_theor)

## ------------------------------------------------------------------------
gas.station <- option.5(5000)

get_mon_resources(gas.station) %>%
  transform(system = round(system * 2/5)) %>% # rescaling
  transform(avg = c(0, cumsum(head(system, -1) * diff(time))) / time) %>%
  ggplot(aes(time, avg)) + geom_line(color="red") + expand_limits(y=0) +
  labs(title="Resource usage: pump", x="time", y="in use") +
  geom_hline(yintercept=2, lty=2, color="red") + 
  geom_hline(yintercept=N_average_theor)

## ---- eval=FALSE---------------------------------------------------------
#  library(microbenchmark)
#  
#  t <- 1000/lambda
#  tm <- microbenchmark(option.1(t),
#                       option.2(t),
#                       option.3(t),
#                       option.4(t),
#                       option.5(t))
#  autoplot(tm) +
#    scale_y_log10(breaks=function(limits) pretty(limits, 5)) +
#    ylab("Time [milliseconds]")

