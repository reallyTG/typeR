## ---- cache = FALSE, include=FALSE---------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>", 
                      fig.width = 6, fig.height = 4, fig.align = "center")

required <- c("simmer.plot")

if (!all(sapply(required, requireNamespace, quietly = TRUE)))
  knitr::opts_chunk$set(eval = FALSE)

## ---- message=FALSE------------------------------------------------------
library(simmer)
library(simmer.plot)

## ---- error = TRUE-------------------------------------------------------
t <- trajectory() %>%
  log_(function() as.character(now(env)))

env <- simmer() %>%
  add_generator("dummy", t, function() 1) %>%
  run(4)

## ------------------------------------------------------------------------
t <- trajectory() %>%
  log_(function() as.character(now(env)))

env <- simmer() %>%
  add_generator("dummy", t, function() 1)

env %>% run(4) %>% invisible

## ------------------------------------------------------------------------
# First, instantiate the environment
env <- simmer()

# Here I'm using it
t <- trajectory() %>%
  log_(function() as.character(now(env)))

# And finally, run it
env %>%
  add_generator("dummy", t, function() 1) %>%
  run(4) %>% invisible

## ------------------------------------------------------------------------
patient_traj <- trajectory(name = "patient_trajectory") %>%
  seize(resource = "doctor", amount = 1) %>%
  timeout(task = 3) %>%
  release(resource = "doctor", amount = 1)

## ------------------------------------------------------------------------
t <- trajectory() %>%
  log_("this is always printed") %>% # level = 0 by default
  log_("this is printed if `log_level>=1`", level = 1) %>%
  log_("this is printed if `log_level>=2`", level = 2)

simmer() %>%
  add_generator("dummy", t, at(0)) %>%
  run() %>% invisible

simmer(log_level = 1) %>%
  add_generator("dummy", t, at(0)) %>%
  run() %>% invisible

simmer(log_level = Inf) %>%
  add_generator("dummy", t, at(0)) %>%
  run() %>% invisible

## ------------------------------------------------------------------------
patient_traj <- trajectory(name = "patient_trajectory") %>%
  set_attribute(keys = "my_key", values = 123) %>%
  timeout(5) %>%
  set_attribute(keys = "my_key", values = 456)

env <- simmer() %>%
  add_generator("patient", patient_traj, at(0), mon = 2) %>%
  run()

get_mon_attributes(env)

## ------------------------------------------------------------------------
patient_traj <- trajectory(name = "patient_trajectory") %>%
  set_attribute("my_key", 123) %>%
  timeout(5) %>%
  set_attribute("my_key", 1, mod="+") %>%
  timeout(5) %>%
  set_attribute("dependent_key", function() ifelse(get_attribute(env, "my_key")<=123, 1, 0)) %>%
  timeout(5) %>%
  set_attribute("independent_key", function() runif(1))

env<- simmer() %>%
  add_generator("patient", patient_traj, at(0), mon = 2)
env %>% run()

get_mon_attributes(env)

## ------------------------------------------------------------------------
writer <- trajectory() %>%
  set_attribute(keys = "my_key", values = 123)

reader <- trajectory() %>%
  log_(function() paste0(get_attribute(env, "my_key")))

env <- simmer() %>%
  add_generator("writer", writer, at(0), mon = 2) %>%
  add_generator("reader", reader, at(1), mon = 2)
env %>% run()

get_mon_attributes(env)

## ------------------------------------------------------------------------
writer <- trajectory() %>%
  set_global(keys = "my_key", values = 123) 

reader <- trajectory() %>%
  log_(function() paste0(get_attribute(env, "my_key"), ", ", 
                         get_global(env, "my_key")))

env <- simmer() %>%
  add_generator("writer", writer, at(0), mon = 2) %>%
  add_generator("reader", reader, at(1), mon = 2)
env %>% run()

get_mon_attributes(env)

## ------------------------------------------------------------------------
patient_traj <- trajectory(name = "patient_trajectory") %>%
  timeout(task = 3)

env <- simmer() %>%
  add_generator("patient", patient_traj, at(0)) %>%
  run()

get_mon_arrivals(env)

## ------------------------------------------------------------------------
patient_traj <- trajectory(name = "patient_trajectory") %>%
  set_attribute("health", function() sample(20:80, 1)) %>%
  # distribution-based timeout
  timeout(function() rexp(1, 10)) %>%
  # attribute-dependent timeout
  timeout(function() (100 - get_attribute(env, "health")) * 2)

env <- simmer() %>%
  add_generator("patient", patient_traj, at(0), mon = 2)
env %>% run()

get_mon_arrivals(env)
get_mon_attributes(env)

## ------------------------------------------------------------------------
traj <- trajectory() %>%
  set_attribute("delay", 2) %>%
  timeout(function() get_attribute(env, "delay")) %>%
  log_("first timeout") %>%
  timeout_from_attribute("delay") %>%
  log_("second timeout")

env <- simmer() %>%
  add_generator("dummy", traj, at(0))
env %>% run() %>% invisible

## ------------------------------------------------------------------------
patient_traj <- trajectory(name = "patient_trajectory") %>%
  seize(resource = "doctor", amount = 1) %>%
  timeout(3) %>%
  release(resource = "doctor", amount = 1)

env <- simmer() %>%
  add_resource("doctor", capacity=1, mon = 1) %>%
  add_generator("patient", patient_traj, at(0)) %>%
  run()

get_mon_resources(env)

## ------------------------------------------------------------------------
patient_traj <- trajectory(name = "patient_trajectory") %>%
  set_attribute("health", function() sample(20:80, 1)) %>%
  set_attribute("docs_to_seize", function() ifelse(get_attribute(env, "health")<50, 1, 2)) %>%
  seize("doctor", function() get_attribute(env, "docs_to_seize")) %>%
  timeout(3) %>%
  release("doctor", function() get_attribute(env, "docs_to_seize"))

env <- simmer() %>%
  add_resource("doctor", capacity = 2, mon = 1) %>%
  add_generator("patient", patient_traj, at(0), mon = 2)
env %>% run()

get_mon_resources(env)
get_mon_attributes(env)

## ------------------------------------------------------------------------
patient_traj <- trajectory(name = "patient_trajectory") %>%
  log_("arriving...") %>%
  seize("doctor", 1) %>%
  # the second patient won't reach this point
  log_("doctor seized") %>%
  timeout(5) %>%
  release("doctor", 1)

env <- simmer() %>%
  add_resource("doctor", capacity = 1, queue_size = 0) %>%
  add_generator("patient", patient_traj, at(0, 1)) %>%
  run()

get_mon_arrivals(env)
get_mon_resources(env)

## ------------------------------------------------------------------------
patient_traj <- trajectory(name = "patient_trajectory") %>%
  log_("arriving...") %>%
  seize("doctor", 1, continue = FALSE,
        reject = trajectory("rejected patient") %>%
          log_("rejected!") %>%
          seize("nurse", 1) %>%
          log_("nurse seized") %>%
          timeout(2) %>%
          release("nurse", 1)) %>%
  # the second patient won't reach this point
  log_("doctor seized") %>%
  timeout(5) %>%
  release("doctor", 1)

env <- simmer() %>%
  add_resource("doctor", capacity = 1, queue_size = 0) %>%
  add_resource("nurse", capacity = 10, queue_size = 0) %>%
  add_generator("patient", patient_traj, at(0, 1)) %>%
  run()

get_mon_arrivals(env)
get_mon_resources(env)

## ------------------------------------------------------------------------
patient_traj <- trajectory(name = "patient_trajectory") %>%
  log_("arriving...") %>%
  seize("doctor", 1, continue = FALSE,
        reject = trajectory("rejected patient") %>%
          log_("rejected!") %>%
          # go for a walk and try again
          timeout(2) %>%
          log_("retrying...") %>%
          rollback(amount = 4, times = Inf)) %>%
  # the second patient will reach this point after a couple of walks
  log_("doctor seized") %>%
  timeout(5) %>%
  release("doctor", 1) %>%
  log_("leaving")

env <- simmer() %>%
  add_resource("doctor", capacity = 1, queue_size = 0) %>%
  add_generator("patient", patient_traj, at(0, 1)) %>%
  run()

get_mon_arrivals(env)
get_mon_resources(env)

## ------------------------------------------------------------------------
patient_traj <- trajectory(name = "patient_trajectory") %>%
  log_("arriving...") %>%
  seize("doctor", 1, continue = c(TRUE, TRUE),
        post.seize = trajectory("admitted patient") %>%
          log_("admitted") %>%
          timeout(5) %>%
          release("doctor", 1),
        reject = trajectory("rejected patient") %>%
          log_("rejected!") %>%
          seize("nurse", 1) %>%
          timeout(2) %>%
          release("nurse", 1)) %>%
  # both patients will reach this point, as continue = c(TRUE, TRUE)
  timeout(10) %>%
  log_("leaving...")

env <- simmer() %>%
  add_resource("doctor", capacity = 1, queue_size = 0) %>%
  add_resource("nurse", capacity = 10, queue_size = 0) %>%
  add_generator("patient", patient_traj, at(0, 1)) %>%
  run()

get_mon_arrivals(env)
get_mon_resources(env)

## ------------------------------------------------------------------------
set.seed(12345)

t1 <- trajectory() %>%
  seize("res1", 1) %>%
  set_capacity(resource = "res1", value = 1, mod="+") %>%
  set_capacity(resource = "res2", value = -1, mod="+") %>%
  timeout(function() rexp(1, 1)) %>%
  release("res1", 1)

t2 <- trajectory() %>%
  seize("res2", 1) %>%
  set_capacity(resource = "res2", value = 1, mod="+") %>%
  set_capacity(resource = "res1", value = -1, mod="+") %>%
  timeout(function() rexp(1, 1)) %>%
  release("res2", 1)

env <- simmer() %>%
  add_resource("res1", capacity = 20, queue_size = Inf) %>%
  add_resource("res2", capacity = 20, queue_size = Inf) %>%
  add_generator("t1_", t1, function() rexp(1, 1)) %>%
  add_generator("t2_", t2, function() rexp(1, 1)) %>%
  run(100)

plot(get_mon_resources(env), "usage", c("res1", "res2"), steps = TRUE)

## ------------------------------------------------------------------------
patient_traj <- trajectory(name = "patient_trajectory") %>%
  select(resources = c("doctor1", "doctor2", "doctor3"), policy = "round-robin") %>%
  set_capacity_selected(1) %>%
  seize_selected(amount = 1) %>%
  timeout(5) %>%
  release_selected(amount = 1)

env <- simmer() %>%
  add_resource("doctor1", capacity = 0) %>%
  add_resource("doctor2", capacity = 0) %>%
  add_resource("doctor3", capacity = 0) %>%
  add_generator("patient", patient_traj, at(0, 1, 2)) %>%
  run()

get_mon_arrivals(env)
get_mon_resources(env)

## ------------------------------------------------------------------------
patient_traj <- trajectory(name = "patient_trajectory") %>%
  set_attribute("resource", function() sample(1:3, 1)) %>%
  select(resources = function() paste0("doctor", get_attribute(env, "resource"))) %>%
  seize_selected(amount = 1) %>%
  timeout(5) %>%
  release_selected(amount = 1)

env <- simmer() %>%
  add_resource("doctor1", capacity = 1) %>%
  add_resource("doctor2", capacity = 1) %>%
  add_resource("doctor3", capacity = 1) %>%
  add_generator("patient", patient_traj, at(0, 1, 2), mon = 2)
env %>% run()

get_mon_attributes(env)
get_mon_arrivals(env)
get_mon_resources(env)

## ------------------------------------------------------------------------
t <- trajectory() %>%
  deactivate(source = "dummy") %>%
  timeout(1) %>%
  activate(source = "dummy")

simmer() %>%
  add_generator("dummy", t, function() 1) %>%
  run(10) %>%
  get_mon_arrivals()

## ------------------------------------------------------------------------
t1 <- trajectory() %>%
  timeout(1)

t2 <- trajectory() %>%
  set_source("dummy", function() 1) %>%
  set_trajectory("dummy", t1) %>%
  timeout(2)

simmer() %>%
  add_generator("dummy", trajectory = t2, distribution = function() 2) %>%
  run(10) %>%
  get_mon_arrivals()

## ------------------------------------------------------------------------
patient_traj <- trajectory(name = "patient_trajectory") %>%
  set_attribute("priority", 3) %>%
  # static values
  set_prioritization(values = c(3, 7, TRUE)) %>%
  # dynamically with a function
  set_prioritization(values = function() {
    prio <- get_prioritization(env)
    attr <- get_attribute(env, "priority")
    c(attr, prio[[2]]+1, FALSE)
  })

## ------------------------------------------------------------------------
t1 <- trajectory("trajectory with a branch") %>%
  seize("server", 1) %>%
  branch(option = function() sample(1:2, 1), continue = c(T, F), 
         trajectory("branch1") %>%
           timeout(function() 1),
         trajectory("branch2") %>%
           timeout(function() rexp(1, 3)) %>%
           release("server", 1)
  ) %>%
  release("server", 1)

## ---- message = FALSE----------------------------------------------------
t0 <- trajectory() %>%
  branch(function() sample(c(1, 2), 1), continue = c(T, T),
         trajectory() %>%
           seize("branch1", 1) %>%
           # do stuff here
           timeout(function() rexp(1, 1)) %>%
           release("branch1", 1),
         trajectory() %>%
           seize("branch2", 1) %>%
           # do stuff here
           timeout(function() rexp(1, 1/2)) %>%
           release("branch2", 1))

env <- simmer() %>%
  add_generator("dummy", t0, at(rep(0, 1000))) %>%
  # Resources with infinite capacity, just for accounting purposes
  add_resource("branch1", Inf) %>%
  add_resource("branch2", Inf) %>%
  run()

arrivals <- get_mon_arrivals(env, per_resource = T)

# Times that each branch was entered
table(arrivals$resource)

# The `activity_time` is the total time inside each branch for each arrival
# Let's see the distributions
ggplot(arrivals) + geom_histogram(aes(x=activity_time)) + facet_wrap(~resource)

## ------------------------------------------------------------------------
t0 <- trajectory() %>%
  log_("Hello!") %>%
  timeout(1) %>%
  rollback(amount = 2, times = 3)

simmer() %>%
  add_generator("hello_sayer", t0, at(0)) %>% 
  run() %>% invisible

## ------------------------------------------------------------------------
t0 <- trajectory() %>%
  set_attribute("happiness", 0) %>%
  log_(function() {
    level <- get_attribute(env, "happiness")
    paste0(">> Happiness level is at: ", level, " -- ", 
           ifelse(level<25,"PETE: I'm feeling crappy...",
                  ifelse(level<50,"PETE: Feelin' a bit moody",
                         ifelse(level<75,"PETE: Just had a good espresso",
                                "PETE: Let's do this! (and stop this loop...)"))))
  }) %>%
  set_attribute("happiness", 25, mod="+") %>%
  rollback(amount = 2, check = function() get_attribute(env, "happiness") < 100)

env <- simmer() %>%
  add_generator("mood_swinger", t0, at(0))
env %>% run() %>% invisible()

## ------------------------------------------------------------------------
patient_traj <- trajectory(name = "patient_trajectory") %>%
  seize("nurse", 1) %>%
  timeout(3) %>%
  release("nurse", 1) %>%
  log_("before leave") %>%
  leave(prob = 1) %>%
  log_("after leave") %>%
  # patients will never seize the doctor
  seize("doctor", 1) %>%
  timeout(3) %>%
  release("doctor", 1)

env <- simmer() %>%
  add_resource("nurse", capacity=1) %>%
  add_resource("doctor", capacity=1) %>%
  add_generator("patient", patient_traj, at(0)) %>%
  run()

get_mon_resources(env)

## ------------------------------------------------------------------------
set.seed(1234)

patient_traj <- trajectory(name = "patient_trajectory") %>%
  seize("nurse", 1) %>%
  timeout(3) %>%
  release("nurse", 1) %>%
  log_("before leave") %>%
  leave(prob = function() runif(1) < 0.5) %>%
  log_("after leave") %>%
  # some patients will seize the doctor
  seize("doctor", 1) %>%
  timeout(3) %>%
  release("doctor", 1)

env <- simmer() %>%
  add_resource("nurse", capacity=1) %>%
  add_resource("doctor", capacity=1) %>%
  add_generator("patient", patient_traj, at(0, 1)) %>%
  run()

get_mon_arrivals(env)
get_mon_resources(env)

## ------------------------------------------------------------------------
t <- trajectory() %>%
  clone(n = 3,
        trajectory("original") %>%
          timeout(1),
        trajectory("clone 1") %>%
          timeout(2),
        trajectory("clone 2") %>%
          timeout(3)) %>%
  synchronize(wait = TRUE) %>%
  timeout(0.5)

env <- simmer(verbose = TRUE) %>%
  add_generator("arrival", t, at(0)) %>%
  run()

get_mon_arrivals(env)

## ------------------------------------------------------------------------
t <- trajectory() %>%
  clone(n = 3,
        trajectory("original") %>%
          timeout(1),
        trajectory("clone 1") %>%
          timeout(2)) %>%
  synchronize(wait = TRUE) %>%
  timeout(0.5)

env <- simmer(verbose = TRUE) %>%
  add_generator("arrival", t, at(0)) %>%
  run()

get_mon_arrivals(env)

## ------------------------------------------------------------------------
t <- trajectory() %>%
  clone(n = 3,
        trajectory("original") %>%
          timeout(1),
        trajectory("clone 1") %>%
          timeout(2),
        trajectory("clone 2") %>%
          timeout(3)) %>%
  synchronize(wait = FALSE) %>%
  timeout(0.5)

env <- simmer(verbose = TRUE) %>%
  add_generator("arrival", t, at(0)) %>%
  run()

get_mon_arrivals(env)

## ------------------------------------------------------------------------
t <- trajectory() %>%
  clone(n = 3,
        trajectory("original") %>%
          timeout(1),
        trajectory("clone 1") %>%
          timeout(2),
        trajectory("clone 2") %>%
          timeout(3)) %>%
  synchronize(wait = FALSE, mon_all = TRUE) %>%
  timeout(0.5)

env <- simmer(verbose = TRUE) %>%
  add_generator("arrival", t, at(0)) %>%
  run()

get_mon_arrivals(env)

## ------------------------------------------------------------------------
set.seed(1234)

t <- trajectory() %>%
  batch(10, timeout = 5, permanent = FALSE) %>%
  seize("rollercoaster", 1) %>%
  timeout(5) %>%
  release("rollercoaster", 1) %>%
  separate()

env <- simmer() %>%
  # capacity and queue_size are defined in batches of 10
  add_resource("rollercoaster", capacity = 1, queue_size = 2) %>%
  add_generator("person", t, function() rexp(1, 2)) %>%
  run(15)

get_mon_arrivals(env, per_resource = TRUE)

## ------------------------------------------------------------------------
t_batch <- trajectory() %>%
  batch(10, timeout = 5, permanent = FALSE, rule = function() FALSE) %>%
  seize("rollercoaster", 1) %>%
  timeout(5) %>%
  release("rollercoaster", 1) %>%
  separate()

t_nobatch <- trajectory() %>%
  seize("rollercoaster", 1) %>%
  timeout(5) %>%
  release("rollercoaster", 1)

set.seed(1234)

env_batch <- simmer() %>%
  # capacity and queue_size are defined in batches of 10
  add_resource("rollercoaster", capacity = 1, queue_size = 2) %>%
  add_generator("person", t_batch, function() rexp(1, 2)) %>%
  run(15)

set.seed(1234)

env_nobatch <- simmer() %>%
  # capacity and queue_size are defined in batches of 10
  add_resource("rollercoaster", capacity = 1, queue_size = 2) %>%
  add_generator("person", t_nobatch, function() rexp(1, 2)) %>%
  run(15)

get_mon_arrivals(env_batch, per_resource = TRUE)
get_mon_arrivals(env_nobatch, per_resource = TRUE)

## ------------------------------------------------------------------------
t0 <- trajectory() %>%
  batch(2) %>%
  timeout(2) %>%
  separate()

t1 <- trajectory() %>%
  timeout(1) %>%
  join(t0)

env <- simmer(verbose = TRUE) %>%
  add_generator("t0_", t0, at(0)) %>%
  add_generator("t1_", t1, at(0)) %>%
  run()

get_mon_arrivals(env)

## ------------------------------------------------------------------------
t0 <- trajectory() %>%
  batch(2) %>%
  timeout(2) %>%
  separate()

t1 <- trajectory() %>%
  timeout(1) %>%
  batch(2) %>%
  timeout(2) %>%
  separate()

## ------------------------------------------------------------------------
t0 <- trajectory() %>%
  batch(2, name = "mybatch") %>%
  timeout(2) %>%
  separate()

t1 <- trajectory() %>%
  timeout(1) %>%
  batch(2, name = "mybatch") %>%
  timeout(2) %>%
  separate()

env <- simmer(verbose = TRUE) %>%
  add_generator("t0_", t0, at(0)) %>%
  add_generator("t1_", t1, at(0)) %>%
  run()

get_mon_arrivals(env)

## ------------------------------------------------------------------------
t0 <- trajectory() %>%
  batch(2, name = "mybatch") %>%
  timeout(2) %>%
  separate()

t1 <- trajectory() %>%
  timeout(1) %>%
  join(t0)

env <- simmer(verbose = TRUE) %>%
  add_generator("t0_", t0, at(0)) %>%
  add_generator("t1_", t1, at(0)) %>%
  run()

get_mon_arrivals(env)

## ------------------------------------------------------------------------
t <- trajectory() %>%
  send(signals = c("signal1", "signal2"))

simmer(verbose = TRUE) %>%
  add_generator("signaler", t, at(0)) %>%
  run() %>% invisible

## ------------------------------------------------------------------------
t <- trajectory() %>%
  send(signals = c("signal1", "signal2"), delay = 3)

simmer(verbose = TRUE) %>%
  add_generator("signaler", t, at(0)) %>%
  run() %>% invisible

## ------------------------------------------------------------------------
t_blocked <- trajectory() %>%
  trap("you shall pass") %>%
  log_("waiting...") %>%
  wait() %>%
  log_("continuing!")

t_signaler <- trajectory() %>%
  log_("you shall pass") %>%
  send("you shall pass")

simmer() %>%
  add_generator("blocked", t_blocked, at(0)) %>%
  add_generator("signaler", t_signaler, at(5)) %>%
  run() %>% invisible

## ------------------------------------------------------------------------
t_blocked <- trajectory() %>%
  trap("you shall pass") %>%
  log_("waiting inside a batch...") %>%
  batch(1) %>%
  wait() %>%
  log_("continuing!")

t_signaler <- trajectory() %>%
  log_("you shall pass") %>%
  send("you shall pass")

simmer() %>%
  add_generator("blocked", t_blocked, at(0)) %>%
  add_generator("signaler", t_signaler, at(5)) %>%
  run() %>% invisible

## ------------------------------------------------------------------------
t_worker <- trajectory() %>%
  trap("you are free to go", 
       handler = trajectory() %>%
         log_("ok, I'm packing...") %>%
         timeout(1)
  ) %>%
  log_("performing a looong task...") %>%
  timeout(100) %>%
  log_("and I'm leaving!")

t_signaler <- trajectory() %>%
  log_("you are free to go") %>%
  send("you are free to go")

simmer() %>%
  add_generator("worker", t_worker, at(0)) %>%
  add_generator("signaler", t_signaler, at(5)) %>%
  run() %>% invisible

## ------------------------------------------------------------------------
t_worker <- trajectory() %>%
  trap("you are free to go", 
       handler = trajectory() %>%
         log_("ok, I'm packing...") %>%
         timeout(1)
  ) %>%
  log_("performing a looong task...") %>%
  untrap("you are free to go") %>%
  timeout(100) %>%
  log_("and I'm leaving!")

t_signaler <- trajectory() %>%
  log_("you are free to go") %>%
  send("you are free to go")

simmer() %>%
  add_generator("worker", t_worker, at(0)) %>%
  add_generator("signaler", t_signaler, at(5)) %>%
  run() %>% invisible

## ------------------------------------------------------------------------
t_worker <- trajectory() %>%
  trap("you are free to go", 
       handler = trajectory() %>%
         log_("ok, I'm packing...") %>%
         timeout(1)
  ) %>%
  log_("performing a looong task...") %>%
  timeout(100) %>%
  log_("and I'm leaving!")

t_signaler <- trajectory() %>%
  log_("you are free to go") %>%
  send("you are free to go")

simmer() %>%
  add_generator("worker", t_worker, at(0)) %>%
  add_generator("signaler", t_signaler, from(5, function() 0.5)) %>%
  run(10) %>% invisible

## ------------------------------------------------------------------------
t_worker <- trajectory() %>%
  trap("you are free to go", 
       handler = trajectory() %>%
         log_("ok, I'm packing...") %>%
         timeout(1),
       interruptible = FALSE            # make it uninterruptible
  ) %>%
  log_("performing a looong task...") %>%
  timeout(100) %>%
  log_("and I'm leaving!")

t_signaler <- trajectory() %>%
  log_("you are free to go") %>%
  send("you are free to go")

simmer() %>%
  add_generator("worker", t_worker, at(0)) %>%
  add_generator("signaler", t_signaler, from(5, function() 0.5)) %>%
  run(10) %>% invisible

## ------------------------------------------------------------------------
t <- trajectory(name = "bank") %>%
  log_("Here I am") %>%
  # renege in 5 minutes
  renege_in(5, 
            out = trajectory() %>%
              log_("Lost my patience. Reneging...")
  ) %>%
  seize("clerk", 1) %>%
  # stay if I'm being attended within 5 minutes
  renege_abort() %>%
  log_("I'm being attended") %>%
  timeout(10) %>%
  release("clerk", 1) %>%
  log_("Finished")

simmer() %>%
  add_resource("clerk", 1) %>%
  add_generator("customer", t, at(0, 1)) %>%
  run() %>% invisible

## ------------------------------------------------------------------------
t <- trajectory(name = "bank") %>%
  log_("Here I am") %>%
  # renege when "renege now" is received
  renege_if("renege now", 
            out = trajectory() %>%
              log_("Ok. Reneging...")
  ) %>%
  seize("clerk", 1) %>%
  # stay if I'm being attended within 5 minutes
  renege_abort() %>%
  log_("I'm being attended") %>%
  timeout(5) %>%
  log_("I say: renege now") %>%
  send("renege now") %>%
  timeout(5) %>%
  release("clerk", 1) %>%
  log_("Finished")

simmer() %>%
  add_resource("clerk", 1) %>%
  add_generator("customer", t, at(0, 1)) %>%
  run() %>% invisible

## ------------------------------------------------------------------------
t1 <- trajectory() %>% seize("dummy", 1)
t2 <- trajectory() %>% timeout(1)
t3 <- trajectory() %>% release("dummy", 1)

t0 <- join(t1, t2, t3)
t0

## ------------------------------------------------------------------------
t0 <- trajectory() %>%
  join(t1) %>%
  timeout(1) %>%
  join(t3)
t0

## ------------------------------------------------------------------------
length(t0)

## ------------------------------------------------------------------------
t0[c(TRUE, FALSE, TRUE)]

## ------------------------------------------------------------------------
t0[c(1, 3)]
t0[c(3, 1)]

## ------------------------------------------------------------------------
t0[-2]

## ------------------------------------------------------------------------
t0[c("seize", "release")]
t0[c("release", "seize")]

## ------------------------------------------------------------------------
t0[]

## ------------------------------------------------------------------------
head(t0, 2)
tail(t0, -1)

## ------------------------------------------------------------------------
t0[[2]]

## ------------------------------------------------------------------------
join(t0, t0)["timeout"]
join(t0, t0)[["timeout"]]

