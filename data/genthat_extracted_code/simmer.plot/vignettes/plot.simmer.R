## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", 
                      fig.width = 6, fig.height = 4, fig.align = "center")

## ---- message=FALSE------------------------------------------------------
library(simmer)
library(parallel)

patient <- trajectory("patients' path") %>%
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

envs <- mclapply(1:100, function(i) {
  simmer("SuperDuperSim") %>%
    add_resource("nurse", 1) %>%
    add_resource("doctor", 2) %>%
    add_resource("administration", 1) %>%
    add_generator("patient", patient, function() rnorm(1, 10, 2)) %>%
    run(80) %>%
    wrap()
})

## ---- message=FALSE------------------------------------------------------
library(simmer.plot)

resources <- get_mon_resources(envs)
plot(resources, metric = "utilization")

## ---- message=FALSE------------------------------------------------------
plot(resources, metric = "usage", c("nurse", "doctor"), items = "server")

## ---- message=FALSE------------------------------------------------------
plot(get_mon_resources(envs[[6]]), metric = "usage", "doctor", items = "server", steps = TRUE)

## ---- message=FALSE------------------------------------------------------
arrivals <- get_mon_arrivals(envs)
plot(arrivals, metric = "flow_time")

