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
lambda <- 3
mu <- 4

m.queue <- trajectory() %>%
  seize("server", amount=1) %>%
  timeout(function() rexp(1, mu)) %>%
  release("server", amount=1)

mm23.env <- simmer() %>%
  add_resource("server", capacity=2, queue_size=1) %>%
  add_generator("arrival", m.queue, function() rexp(1, lambda)) %>%
  run(until=2000)

## ------------------------------------------------------------------------
get_mon_arrivals(mm23.env) %>%
  with(sum(!finished) / length(finished))

## ------------------------------------------------------------------------
# Theoretical value
rho <- lambda/mu
div <- 1 / c(1, 1, factorial(2) * 2^(2:3-2))
mm23.N <- sum(0:3 * rho^(0:3) * div) / sum(rho^(0:3) * div)

# Evolution of the average number of customers in the system
plot(get_mon_resources(mm23.env), "usage", "server", items="system") +
  geom_hline(yintercept=mm23.N)

## ------------------------------------------------------------------------
update.delay <- trajectory() %>%
  set_attribute(c("start", "multiplier", "delay"), function() {
    # previous multiplier, service time left
    multiplier <- get_attribute(env, "multiplier")
    left <- sum(get_attribute(env, c("start", "delay"))) - now(env)
    # distribute processing capacity
    new_multiplier <- capacity / get_server_count(env, "sd.server")
    # return new values
    c(now(env), new_multiplier, left * multiplier / new_multiplier)
  }) %>%
  timeout_from_attribute("delay")

## ------------------------------------------------------------------------
sd.queue <- trajectory() %>%
  seize("sd.server") %>%
  # initialisation
  set_attribute(c("start", "multiplier", "delay"), function()
    c(now(env), 1, rexp(1, mu))) %>%
  # set the handler and trigger it
  trap("update delay", handler=update.delay) %>%
  send("update delay") %>%
  # returning point
  untrap("update delay") %>%
  release("sd.server") %>%
  send("update delay")

## ------------------------------------------------------------------------
lambda <- mu <- 4
capacity <- 2
arrivals <- data.frame(time=rexp(2000*lambda, lambda))

env <- simmer() %>%
  # M/M/2
  add_resource("server", capacity) %>%
  add_dataframe("arrival", m.queue, arrivals) %>%
  # state-dependent service rate
  add_resource("sd.server", capacity) %>%
  add_dataframe("sd.arrival", sd.queue, arrivals)

env %>%
  run() %>%
  get_mon_resources() %>%
  plot(metric="usage", c("server", "sd.server"))

## ------------------------------------------------------------------------
mean_pkt_size <- 100        # bytes
lambda1 <- 2                # pkts/s
lambda3 <- 0.5              # pkts/s
lambda4 <- 0.6              # pkts/s
rate <- 2.2 * mean_pkt_size # bytes/s

# set an exponential message size of mean mean_pkt_size
set_msg_size <- function(.)
  set_attribute(., "size", function() rexp(1, 1/mean_pkt_size))

# seize an M/D/1 queue by id; the timeout is function of the message size
md1 <- function(., id)
  seize(., paste0("md1_", id), 1) %>%
  timeout(function() get_attribute(env, "size") / rate) %>%
  release(paste0("md1_", id), 1)

## ------------------------------------------------------------------------
to_queue_1 <- trajectory() %>%
  set_msg_size() %>%
  md1(1) %>%
  leave(0.25) %>%
  md1(2) %>%
  branch(
    function() (runif(1) > 0.65) + 1, continue=c(F, F),
    trajectory() %>% md1(3),
    trajectory() %>% md1(4)
  )

to_queue_3 <- trajectory() %>%
  set_msg_size() %>%
  md1(3)

to_queue_4 <- trajectory() %>%
  set_msg_size() %>%
  md1(4)

## ------------------------------------------------------------------------
env <- simmer()
for (i in 1:4) env %>% 
  add_resource(paste0("md1_", i))
env %>%
  add_generator("arrival1_", to_queue_1, function() rexp(1, lambda1), mon=2) %>%
  add_generator("arrival3_", to_queue_3, function() rexp(1, lambda3), mon=2) %>%
  add_generator("arrival4_", to_queue_4, function() rexp(1, lambda4), mon=2) %>%
  run(4000)

## ------------------------------------------------------------------------
res <- get_mon_arrivals(env, per_resource = TRUE) %>%
  subset(resource %in% c("md1_3", "md1_4"), select=c("name", "resource"))

arr <- get_mon_arrivals(env) %>%
  transform(waiting_time = end_time - (start_time + activity_time)) %>%
  transform(generator = regmatches(name, regexpr("arrival[[:digit:]]", name))) %>%
  merge(res)

aggregate(waiting_time ~ generator + resource, arr, function(x) sum(x)/length(x))
get_n_generated(env, "arrival1_") + get_n_generated(env, "arrival4_")
aggregate(waiting_time ~ generator + resource, arr, length)

