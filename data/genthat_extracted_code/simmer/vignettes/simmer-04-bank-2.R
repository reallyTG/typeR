## ---- cache = FALSE, include=FALSE---------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>",
                      fig.width = 6, fig.height = 4, fig.align = "center")

required <- c("simmer.plot")

if (!all(sapply(required, requireNamespace, quietly = TRUE)))
  knitr::opts_chunk$set(eval = FALSE)

## ---- message = FALSE----------------------------------------------------
library(simmer)

set.seed(1933)

bank <- simmer()

customer <-
  trajectory("Customer's path") %>%
  set_attribute("start_time", function() {now(bank)}) %>%
  log_(function() {
         paste("Queue is", get_queue_count(bank, "counter"), "on arrival")
         }) %>%
  seize("counter") %>%
  log_(function() {paste("Waited", now(bank) - get_attribute(bank, "start_time"))}) %>%
  timeout(12) %>%
  release("counter") %>%
  log_("Completed")

bank <-
  simmer("bank") %>%
  add_resource("counter") %>%
  add_generator("Customer", customer, function() {c(0, rexp(4, 1/10), -1)}) %>%
  add_generator("Guido", customer, at(23), priority = 1)

bank %>% run(until = 400)
bank %>%
  get_mon_arrivals() %>%
  transform(waiting_time = end_time - start_time - activity_time)

## ---- message = FALSE----------------------------------------------------
library(simmer)

set.seed(1933)

bank <- simmer()

customer <-
  trajectory("Customer's path") %>%
  set_attribute("start_time", function() {now(bank)}) %>%
  log_(function() {
         paste("Queue is", get_queue_count(bank, "counter"), "on arrival")
         }) %>%
  seize("counter") %>%
  log_(function() {paste("Waited", now(bank) - get_attribute(bank, "start_time"))}) %>%
  timeout(12) %>%
  release("counter") %>%
  log_("Completed")

bank <-
  simmer("bank") %>%
  add_resource("counter", preemptive = TRUE) %>%
  add_generator("Customer", customer, function() {c(0, rexp(4, 1/10), -1)}) %>%
  add_generator("Guido", customer, at(23), priority = 1)

bank %>% run(until = 400)
bank %>%
  get_mon_arrivals() %>%
  transform(waiting_time = end_time - start_time - activity_time)

## ------------------------------------------------------------------------
library(simmer)

timeInBank <- 12 # mean, minutes
ARRint <- 10     # mean, minutes
numServers <- 1  # servers
maxInSystem <- 2 # customers
maxInQueue <- maxInSystem - numServers

maxNumber <- 8
maxTime <- 400  # minutes
set.seed(59098)

bank <- simmer()

customer <-
  trajectory("Customer's path") %>%
  log_("Here I am") %>%
  set_attribute("start_time", function() {now(bank)}) %>%
  seize("counter",
        continue = FALSE,
        reject =
          trajectory("Balked customer") %>%
          log_("BALKING")) %>%
  log_(function() {paste("Waited", now(bank) - get_attribute(bank, "start_time"))}) %>%
  timeout(function() {rexp(1, 1/timeInBank)}) %>%
  release("counter") %>%
  log_("Finished")

bank <-
  simmer("bank") %>%
  add_resource("counter",
               capacity = numServers,
               queue_size = maxInQueue) %>%
  add_generator("Customer",
                customer,
                at(c(0, cumsum(rexp(maxNumber - 1, 1 / ARRint)))))

bank %>% run(until = maxTime)

number_balked <- sum(!get_mon_arrivals(bank)$finished)
paste("Balking rate is", number_balked / now(bank), "customers per minute.")

## ---- message = FALSE----------------------------------------------------
library(simmer)

timeInBank <- 15 # mean, minutes
ARRint <- 10     # mean, minutes
numServers <- 1  # servers

maxNumber <- 5
maxTime <- 400   # minutes
maxWaitTime <- 12 # minutes, maximum time to wait before reneging
set.seed(59030)

bank <- simmer()

customer <-
  trajectory("Customer's path") %>%
  log_("Here I am") %>%
  set_attribute("start_time", function() {now(bank)}) %>%
  renege_in(maxWaitTime,
            out = trajectory("Reneging customer") %>%
              log_(function() {
                     paste("Waited", now(bank) - get_attribute(bank, "start_time"), "I am off")
                   })) %>%
  seize("counter") %>%
  renege_abort() %>% # Stay if I'm being attended within maxWaitTime
  log_(function() {paste("Waited", now(bank) - get_attribute(bank, "start_time"))}) %>%
  timeout(function() {rexp(1, 1/timeInBank)}) %>%
  release("counter") %>%
  log_("Completed")

bank <-
  simmer("bank") %>%
  add_resource("counter",
               capacity = numServers) %>%
  add_generator("Customer",
                customer,
                at(c(0, cumsum(rexp(maxNumber - 1, 1 / ARRint)))))

bank %>% run(until = maxTime)

## ---- message = FALSE----------------------------------------------------
library(simmer)

timeInBank <-  20
timeOfCall <-   9
onphone    <-   3
maxTime    <- 100

bank <- simmer()

customer <-
  trajectory("Customer's path") %>%
  trap("phonecall",
       handler = trajectory() %>%
         log_("Excuse me") %>%
         set_attribute(
           "timeleft", function() {
             sum(get_attribute(bank, c("timeleft", "start"))) - now(bank)
         }) %>%
         log_("Hello! I'll call back") %>%
         timeout(onphone) %>%
         log_("Sorry, where were we?") %>%
         set_attribute("start", function() {now(bank)}) %>%
         log_(function() {paste("Time left:", get_attribute(bank, "timeleft"))}) %>%
         timeout_from_attribute("timeleft")
       ) %>%
  log_("Here I am") %>%
  set_attribute("timeleft", timeInBank) %>%
  set_attribute("start", function() {now(bank)}) %>%
  timeout(timeInBank) %>%
  log_("Completed")

phone <-
  trajectory("Phone") %>%
  log_("Ringgg!") %>%
  send("phonecall")

bank <-
  simmer("bank") %>%
  add_generator("Klaus", customer, at(0)) %>%
  add_generator("Phone", phone, at(timeOfCall, timeOfCall + 7))

bank %>% run(until = maxTime)

## ---- message = FALSE----------------------------------------------------
library(simmer)

maxTime = 400
set.seed(393937)

bank <- simmer()

customer <-
  trajectory("Customer's path") %>%
  log_(function()
    if (get_capacity(bank, "door") == 0)
      "Here I am but the door is shut."
    else "Here I am and the door is open."
  ) %>%
  seize("door") %>%
  log_("I can go in!") %>%
  release("door") %>%
  seize("counter") %>%
  timeout(function() {rexp(1, 1/10)}) %>%
  release("counter")

openTime <- rexp(1, 1/10)

door_schedule <- schedule(c(0, openTime), c(0, Inf))

doorman <-
  trajectory() %>%
  timeout(openTime) %>%
  log_("Ladies and Gentlemen! You may all enter.")

bank <-
  simmer("bank") %>%
  add_resource("door", capacity = door_schedule) %>%
  add_resource("counter") %>%
  add_generator("Customer",
                customer,
                at(c(0, cumsum(rexp(5 - 1, 0.1))))) %>%
  add_generator("Doorman", doorman, at(0))

bank %>% run(until = maxTime)
bank %>%
  get_mon_arrivals() %>%
  transform(waiting_time = end_time - start_time - activity_time)

## ---- message = FALSE----------------------------------------------------
library(simmer)

maxTime = 150

customer <-
  trajectory("Customer's path") %>%
  log_("Here I am, but the door is shut.") %>%
  set_attribute("start_time", function() {now(bank)}) %>%
  seize("door") %>%
  log_("The door is open!") %>%
  log_(function() {paste("Waited", now(bank) - get_attribute(bank, "start_time"))}) %>%
  release("door") %>%
  seize("counter") %>%
  timeout(function() {rexp(1, 1/10)}) %>%
  release("counter") %>%
  log_("Finished.")

door_schedule <- schedule(c(30, 30), c(Inf, 0), period = 30)

doorman <-
  trajectory("Doorman") %>%
  timeout(30) %>%
  log_("You may enter.") %>%
  rollback(2, times = Inf)

set.seed(393939)
bank <- simmer("bank")
bank %>%
  add_resource("door", capacity = door_schedule) %>%
  add_resource("counter") %>%
  add_generator("Customer",
                customer,
                at(c(0, cumsum(rexp(5 - 1, 0.1))))) %>%
  add_generator("Doorman", doorman, at(0))

bank %>% run(until = maxTime)
bank %>%
  get_mon_arrivals() %>%
  transform(waiting_time = end_time - start_time - activity_time)

## ---- message = FALSE----------------------------------------------------
library(simmer)

maxTime = 150

customer <-
  trajectory("Customer's path") %>%
  log_("Here I am, but the door is shut.") %>%
  set_attribute("start_time", function() {now(bank)}) %>%
  batch(n = Inf, timeout = 30) %>%
  separate() %>%
  log_("The door is open!") %>%
  log_(function() {paste("Waited", now(bank) - get_attribute(bank, "start_time"))}) %>%
  seize("counter") %>%
  timeout(function() {rexp(1, 1/10)}) %>%
  release("counter") %>%
  log_("Finished.")

doorman <-
  trajectory("Doorman") %>%
  timeout(30) %>%
  log_("You may enter.") %>%
  rollback(2, times = Inf)

set.seed(393939)
bank <- simmer("bank")
bank %>%
  add_resource("door") %>%
  add_resource("counter") %>%
  add_generator("Customer",
                customer,
                at(c(0, cumsum(rexp(5 - 1, 0.1))))) %>%
  add_generator("Doorman", doorman, at(0))

bank %>% run(until = maxTime)
bank %>%
  get_mon_arrivals() %>%
  transform(waiting_time = end_time - start_time - activity_time)

## ---- eval = FALSE-------------------------------------------------------
#  get_capacity
#  get_mon_arrivals
#  get_mon_attributes
#  get_mon_resources
#  get_n_activities
#  get_n_generated
#  get_queue_count
#  get_queue_size
#  get_server_count

## ------------------------------------------------------------------------
library(simmer)
library(simmer.plot)
# library(ggplot2) # (automatically loaded with simmer.plot)

bank <- simmer()

customer <-
  trajectory("Customer's path") %>%
  seize("counter") %>%
  timeout(12) %>%
  release("counter")

set.seed(393939)
bank <-
  simmer("bank") %>%
  add_resource("counter") %>%
  add_generator("Customer",
                customer,
                at(c(0, cumsum(rexp(20 - 1, 0.1)))))

bank %>% run(400)
bank %>%
  get_mon_arrivals %>%
  ggplot(aes(end_time - start_time)) +
  geom_histogram() +
  xlab("Time spent in the system") +
  ylab("Number of customers")

## ---- message = FALSE----------------------------------------------------
library(simmer)

set.seed(1234)

bank <- simmer()

customer <-
  trajectory("Customer's path") %>%
  log_("Arrived") %>%
  set_attribute("start_time", function() {now(bank)}) %>%
  seize("counter") %>%
  log_("Got counter") %>%
  log_(function() {paste("Waited", now(bank) - get_attribute(bank, "start_time"))}) %>%
  timeout(12) %>%
  release("counter") %>%
  log_("Finished")

bank <-
  simmer("bank") %>%
  add_resource("counter") %>%
  add_generator("Customer", customer, function() {c(0, rexp(4, 1/10), -1)})

bank %>% run(until = 400)
customer_monitor <-
  get_mon_arrivals(bank) %>%
  transform(wait = end_time - start_time - activity_time)
mean_waiting_time <- mean(customer_monitor$wait)

resource_monitor <- get_mon_resources(bank)

queue_state <- head(resource_monitor$queue, -1)
server_state <- head(resource_monitor$server, -1)

time_state_lasted <- diff(resource_monitor$time)
time_at_end <- max(resource_monitor$time)

mean_active_customers <- sum(server_state * time_state_lasted) / time_at_end
mean_waiting_customers <- sum(queue_state * time_state_lasted) / time_at_end

cat(" Average waiting = ", mean_waiting_customers, "\n",
    "Average active  = ", mean_active_customers, "\n")

## ---- message = FALSE----------------------------------------------------
library(simmer)
library(simmer.plot)

timeInBank <- 12 # mean, minutes

set.seed(1234)

bank <- simmer()

customer <-
  trajectory("Customer's path") %>%
  set_attribute("start_time", function() {now(bank)}) %>%
  seize("counter") %>%
  timeout(function() {rexp(1, 1/timeInBank)}) %>%
  release("counter")

bank <-
  simmer("bank") %>%
  add_resource("counter") %>%
  add_generator("Customer", customer, function() {c(0, rexp(19, 1/10), -1)})

bank %>% run(until = 400)

plot(bank,
     what = "resources",
     metric = "usage",
     names = "counter",
     items = "system",
     steps = TRUE)

