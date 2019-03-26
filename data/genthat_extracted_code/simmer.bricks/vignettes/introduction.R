## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", 
                      fig.width = 6, fig.height = 4, fig.align = "center")

## ---- message=FALSE------------------------------------------------------
library(simmer)

patient.1 <- trajectory("patients' path") %>%
  ## add an intake activity 
  seize("nurse", 1) %>%
  timeout(function() rnorm(1, 15)) %>%
  release("nurse", 1) %>%
  ## add a consultation activity
  seize("doctor", 1) %>%
  timeout(function() rnorm(1, 20)) %>%
  release("doctor", 1) %>%
  ## add a planning activity
  seize("administration", 1) %>%
  timeout(function() rnorm(1, 5)) %>%
  release("administration", 1)

## ---- message=FALSE------------------------------------------------------
library(simmer.bricks)

patient.2 <- trajectory("patients' path") %>%
  ## add an intake activity 
  visit("nurse", function() rnorm(1, 15)) %>%
  ## add a consultation activity
  visit("doctor", function() rnorm(1, 20)) %>%
  ## add a planning activity
  visit("administration", function() rnorm(1, 5))

## ------------------------------------------------------------------------
patient.1
patient.2

## ------------------------------------------------------------------------
env <- simmer() %>%
  add_resource("res1") %>%
  add_resource("res2", preemptive=TRUE)

t <- trajectory() %>%
  seize("res1") %>%
  log_("res1 seized") %>%
  seize("res2") %>%
  log_("res2 seized") %>%
  # inoperative for 2 units of time
  delayed_release("res1", 2) %>% 
  log_("res1 released") %>%
  # inoperative for 5 units of time
  delayed_release("res2", 5, preemptive=TRUE) %>%
  log_("res1 released")

env %>%
  add_generator("dummy", t, at(0, 1)) %>%
  run() %>% invisible

## ---- error=TRUE---------------------------------------------------------
t <- trajectory() %>%
  seize("room") %>%
  clone(
    n = 2,
    trajectory("doctor") %>%
      timeout(1),
    trajectory("nurse") %>%
      timeout(2)) %>%
  synchronize(wait = TRUE) %>%
  timeout(0.5) %>%
  release("room",1)

simmer() %>%
  add_resource("room") %>%
  add_generator("visit", t, at(0)) %>%
  run()

## ------------------------------------------------------------------------
env <- simmer()

t <- trajectory() %>%
  seize("room") %>%
  log_("room seized") %>%
  do_parallel(
    trajectory("doctor") %>%
      timeout(1) %>%
      log_("doctor path done"),
    trajectory("nurse") %>%
      timeout(2) %>%
      log_("nurse path done"),
    .env = env
  ) %>%
  timeout(0.5) %>%
  release("room",1) %>%
  log_("room released")

env %>%
  add_resource("room") %>%
  add_generator("visit", t, at(0)) %>%
  run() %>% invisible

## ------------------------------------------------------------------------
t <- trajectory() %>%
  interleave(c("A", "B"), c(1, 2))

t

## ------------------------------------------------------------------------
simmer() %>%
  add_resource("A", 3, 1) %>%
  add_resource("B_token", 2, Inf) %>%
  add_resource("B", 1, 1) %>%
  add_generator("dummy", t, at(rep(0, 3))) %>%
  run(4) %>%
  get_mon_arrivals(per_resource = TRUE)

