## ---- cache = FALSE, include=FALSE---------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>",
                      fig.width = 6, fig.height = 4, fig.align = "center")

## ------------------------------------------------------------------------
library(simmer)

customer <-
  trajectory("Customer's path") %>%
  log_("Here I am") %>%
  timeout(10) %>%
  log_("I must leave")

bank <-
  simmer("bank") %>%
  add_generator("Customer", customer, at(5))

bank %>% run(until = 100)
bank %>% get_mon_arrivals()

## ------------------------------------------------------------------------
library(simmer)

set.seed(10212)

customer <-
  trajectory("Customer's path") %>%
  log_("Here I am") %>%
  timeout(10) %>%
  log_("I must leave")

bank <-
  simmer("bank") %>%
  add_generator("Customer", customer, at(rexp(1, 1/5)))

bank %>% run(until = 100)
bank %>% get_mon_arrivals()

## ------------------------------------------------------------------------
# Function to specify a series of waiting times, that loop around
loop <- function(...) {
    time_diffs <- c(...)
    i <- 0
    function() {
      if (i < length(time_diffs)) {
        i <<- i+1
      } else {
        i <<- 1
      }
      return(time_diffs[i])
    }
  }

x <- loop(10, 7, 20)
x(); x(); x(); x(); x()

## ------------------------------------------------------------------------
library(simmer)

# Function to specify a series of waiting times in a loop
loop <- function(...) {
    time_diffs <- c(...)
    i <- 0
    function() {
      if (i < length(time_diffs)) {
        i <<- i+1
      } else {
        i <<- 1
      }
      return(time_diffs[i])
    }
  }

customer <-
  trajectory("Customer's path") %>%
  log_("Here I am") %>%
  timeout(loop(7, 10, 20)) %>%
  log_("I must leave")


bank <-
  simmer("bank") %>%
  add_generator("Customer", customer, at(2, 5, 12))

bank %>% run(until = 400)
bank %>% get_mon_arrivals()

## ------------------------------------------------------------------------
library(simmer)

# Create a template trajectory
customer <-
  trajectory("Customer's path") %>%
  log_("Here I am") %>%
  timeout(1) %>% # The timeout of 1 is a placeholder to be overwritten later
  log_("I must leave")

# Create three copies of the template
Klaus <- customer
Tony <- customer
Evelyn <- customer

# Modify the timeout of each copy
Klaus[2] <- timeout(trajectory(), 10)
Tony[2] <- timeout(trajectory(), 7)
Evelyn[2] <- timeout(trajectory(), 20)

# Check that the modifications worked
Klaus
Tony
Evelyn

bank <-
  simmer("bank") %>%
  add_generator("Klaus", Klaus, at(5)) %>%
  add_generator("Tony", Tony, at(2)) %>%
  add_generator("Evelyn", Evelyn, at(12))

bank %>% run(until = 400)
bank %>% get_mon_arrivals()

## ------------------------------------------------------------------------
library(simmer)

customer <-
  trajectory("Customer's path") %>%
  log_("Here I am") %>%
  timeout(12) %>%
  log_("I must leave")

bank <-
  simmer("bank") %>%
  add_generator("Customer", customer, from_to(0, 41, function() {10}))

bank %>% run(until = 400)
bank %>% get_mon_arrivals()

## ------------------------------------------------------------------------
library(simmer)

set.seed(1289)

customer <-
  trajectory("Customer's path") %>%
  log_("Here I am") %>%
  timeout(12) %>%
  log_("I must leave")

bank <-
  simmer("bank") %>%
  add_generator("Customer", customer, function() {c(0, rexp(4, 1/10), -1)})

bank %>% run(until = 400)
bank %>% get_mon_arrivals()

## ---- message = FALSE----------------------------------------------------
library(simmer)

set.seed(1234)

bank <- simmer()

customer <-
  trajectory("Customer's path") %>%
  log_("Here I am") %>%
  set_attribute("start_time", function() {now(bank)}) %>%
  seize("counter") %>%
  log_(function() {paste("Waited: ", now(bank) - get_attribute(bank, "start_time"))}) %>%
  timeout(12) %>%
  release("counter") %>%
  log_(function() {paste("Finished: ", now(bank))})

bank <-
  simmer("bank") %>%
  add_resource("counter") %>%
  add_generator("Customer", customer, function() {c(0, rexp(4, 1/10), -1)})

bank %>% run(until = 400)
bank %>%
  get_mon_arrivals() %>%
  transform(waiting_time = end_time - start_time - activity_time)

## ---- message = FALSE----------------------------------------------------
library(simmer)

set.seed(1269)

customer <-
  trajectory("Customer's path") %>%
  log_("Here I am") %>%
  set_attribute("start_time", function() {now(bank)}) %>%
  seize("counter") %>%
  log_(function() {paste("Waited: ", now(bank) - get_attribute(bank, "start_time"))}) %>%
  # timeout(rexp(1, 1/12)) would generate a single random time and use it for
  # every arrival, whereas the following line generates a random time for each
  # arrival
  timeout(function() {rexp(1, 1/12)}) %>%
  release("counter") %>%
  log_(function() {paste("Finished: ", now(bank))})

bank <-
  simmer("bank") %>%
  add_resource("counter") %>%
  add_generator("Customer", customer, function() {c(0, rexp(4, 1/10), -1)})

bank %>% run(until = 400)
bank %>%
  get_mon_arrivals() %>%
  transform(waiting_time = end_time - start_time - activity_time)

## ---- message = FALSE----------------------------------------------------
library(simmer)

set.seed(1269)

customer <-
  trajectory("Customer's path") %>%
  log_("Here I am") %>%
  set_attribute("start_time", function() {now(bank)}) %>%
  seize("counter") %>%
  log_(function() {paste("Waited: ", now(bank) - get_attribute(bank, "start_time"))}) %>%
  timeout(function() {rexp(1, 1/12)}) %>%
  release("counter") %>%
  log_(function() {paste("Finished: ", now(bank))})

bank <-
  simmer("bank") %>%
  add_resource("counter", 2) %>% # Here is the change
  add_generator("Customer", customer, function() {c(0, rexp(4, 1/10), -1)})

bank %>% run(until = 400)
bank %>%
  get_mon_arrivals() %>%
  transform(waiting_time = end_time - start_time - activity_time)

## ---- message = FALSE----------------------------------------------------
library(simmer)

set.seed(1014)

customer <-
  trajectory("Customer's path") %>%
  log_("Here I am") %>%
  set_attribute("start_time", function() {now(bank)}) %>%
  select(c("counter1", "counter2"), policy = "shortest-queue") %>%
  seize_selected() %>%
  log_(function() {paste("Waited: ", now(bank) - get_attribute(bank, "start_time"))}) %>%
  timeout(function() {rexp(1, 1/12)}) %>%
  release_selected() %>%
  log_(function() {paste("Finished: ", now(bank))})

bank <-
  simmer("bank") %>%
  add_resource("counter1", 1) %>%
  add_resource("counter2", 1) %>%
  add_generator("Customer", customer, function() {c(0, rexp(4, 1/10), -1)})

bank %>% run(until = 400)
bank %>%
  get_mon_arrivals() %>%
  transform(service_start_time = end_time - activity_time) %>%
  .[order(.$start_time),]
bank %>%
  get_mon_resources() %>%
  .[order(.$time),]

## ---- message = FALSE----------------------------------------------------
library(simmer)

set.seed(100005)

customer <-
  trajectory("Customer's path") %>%
  seize("counter") %>%
  timeout(function() {rexp(1, 1/12)}) %>%
  release("counter")

bank <-
  simmer("bank") %>%
  add_resource("counter", 2) %>%
  add_generator("Customer", customer, function() {c(0, rexp(49, 1/10), -1)})

bank %>% run(until = 1000)

result <-
  bank %>%
  get_mon_arrivals() %>%
  transform(waiting_time = end_time - start_time - activity_time)

## ---- message = FALSE----------------------------------------------------
paste("Average wait for ", sum(result$finished), " completions was ",
      mean(result$waiting_time), "minutes.")

## ---- message = FALSE----------------------------------------------------
library(simmer)
library(parallel)

customer <-
  trajectory("Customer's path") %>%
  seize("counter") %>%
  timeout(function() {rexp(1, 1/12)}) %>%
  release("counter")

mclapply(c(393943, 100005, 777999555, 319999772), function(the_seed) {
  set.seed(the_seed)

  bank <-
    simmer("bank") %>%
    add_resource("counter", 2) %>%
    add_generator("Customer", customer, function() {c(0, rexp(49, 1/10), -1)})

  bank %>% run(until = 400)
  result <-
    bank %>%
    get_mon_arrivals() %>%
    transform(waiting_time = end_time - start_time - activity_time)
  paste("Average wait for ", sum(result$finished), " completions was ",
        mean(result$waiting_time), "minutes.")
}) %>% unlist()

