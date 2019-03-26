## ---- setup, include=FALSE-----------------------------------------------
knitr::opts_chunk$set(fig.width=5, fig.height=3, warning=FALSE, message=FALSE)

knitr::knit_hooks$set(document = function(x, options) {
  # fix line width
  x <- gsub("queue status: 0(Inf) }", "queue... }", x, fixed=TRUE)
  x
})

Sys.setlocale("LC_ALL", "en_GB.UTF-8")

## ----job-shop, out.width='80%', echo=FALSE, fig.cap='The job shop activity cycle diagram.'----
knitr::include_graphics("includes/jss-job-shop.pdf")

## ---- job-shop-1---------------------------------------------------------
library("simmer")

set.seed(1234)

(env <- simmer("Job Shop"))

RUNNING <- function() rexp(1, 1)
RETOOL <- function() rexp(1, 2)
RESET <- function() rexp(1, 3)
AWAY <- function() rexp(1, 1)
CHECK_WORN <- function() runif(1) < 0.2
NEW_JOB <- function() rexp(1, 5)
NEW_TASK <- function() rexp(1, 1)

## ---- job-shop-2---------------------------------------------------------
job <- trajectory() %>%
  seize("machine") %>%
  timeout(RUNNING) %>%
  branch(
    CHECK_WORN, continue = TRUE,
    trajectory() %>%
      seize("operative") %>%
      timeout(RETOOL) %>%
      release("operative")
  ) %>%
  seize("operative") %>%
  timeout(RESET) %>%
  release("operative") %>%
  release("machine")

task <- trajectory() %>%
  seize("operative") %>%
  timeout(AWAY) %>%
  release("operative")

## ---- job-shop-3---------------------------------------------------------
env %>%
  add_resource("machine", 10) %>%
  add_resource("operative", 5) %>%
  add_generator("job", job, NEW_JOB) %>%
  add_generator("task", task, NEW_TASK) %>%
  run(until=1000)

## ---- job-shop-4---------------------------------------------------------
aggregate(cbind(server, queue) ~ resource, get_mon_resources(env), mean)

## ---- trajectory-1-------------------------------------------------------
traj0 <- trajectory() %>%
  log_("Entering the trajectory") %>%
  timeout(10) %>%
  log_("Leaving the trajectory")

## ---- trajectory-2-------------------------------------------------------
traj1 <- trajectory() %>%
  log_(function() "Entering the trajectory") %>%
  timeout(function() 10) %>%
  log_(function() "Leaving the trajectory")

## ---- trajectory-3-------------------------------------------------------
traj2 <- join(traj0[c(1, 3)], traj0[2])
traj2[1] <- traj2[3]
traj2

## ---- trajectory-attributes----------------------------------------------
env <- simmer()

traj <- trajectory() %>%
  set_attribute("weight", 80) %>%
  set_attribute("weight", 1, mod="+") %>%
  log_(function() paste0("My weight is ", get_attribute(env, "weight")))

## ---- trajectory-seize-advanced------------------------------------------
patient <- trajectory() %>%
  log_("arriving...") %>%
  seize(
    "doctor", 1, continue = c(TRUE, FALSE),
    post.seize = trajectory("accepted patient") %>%
      log_("doctor seized"),
    reject = trajectory("rejected patient") %>%
      log_("rejected!") %>%
      seize("nurse", 1) %>%
      log_("nurse seized") %>%
      timeout(2) %>%
      release("nurse", 1) %>%
      log_("nurse released")
  ) %>%
  timeout(5) %>%
  release("doctor", 1) %>%
  log_("doctor released")

env <- simmer() %>%
  add_resource("doctor", capacity = 1, queue_size = 0) %>%
  add_resource("nurse", capacity = 10, queue_size = 0) %>%
  add_generator("patient", patient, at(0, 1)) %>%
  run()

## ---- trajectory-sources-------------------------------------------------
traj <- trajectory() %>%
  deactivate("dummy") %>%
  timeout(1) %>%
  activate("dummy")

simmer() %>%
  add_generator("dummy", traj, function() 1) %>%
  run(10) %>%
  get_mon_arrivals()

## ---- trajectory-branching-----------------------------------------------
env <- simmer()

traj <- trajectory() %>%
  branch(
    option = function() round(now(env)), continue = c(FALSE, TRUE),
    trajectory() %>% log_("branch 1"),
    trajectory() %>% log_("branch 2")
  ) %>%
  clone(
    n = 2,
    trajectory() %>% log_("clone 0"),
    trajectory() %>% log_("clone 1")
  ) %>%
  synchronize(wait = TRUE) %>%
  log_("out")

env %>%
  add_generator("dummy", traj, at(1, 2)) %>%
  run() %>% invisible

## ---- trajectory-loops---------------------------------------------------
hello <- trajectory() %>%
  log_("Hello!") %>%
  timeout(1) %>%
  rollback(amount = 2, times = 2)

simmer() %>%
  add_generator("hello_sayer", hello, at(0)) %>%
  run() %>% invisible

## ---- trajectory-batching------------------------------------------------
roller <- trajectory() %>%
  batch(10, timeout = 5, permanent = FALSE) %>%
  seize("rollercoaster", 1) %>%
  timeout(5) %>%
  release("rollercoaster", 1) %>%
  separate()

## ---- trajectory-async---------------------------------------------------
t_blocked <- trajectory() %>%
  trap(
    "you shall pass",
    handler = trajectory() %>%
      log_("got a signal!")
  ) %>%
  log_("waiting...") %>%
  wait() %>%
  log_("continuing!")

t_signal <- trajectory() %>%
  log_("you shall pass") %>%
  send("you shall pass")

simmer() %>%
  add_generator("blocked", t_blocked, at(0)) %>%
  add_generator("signaler", t_signal, at(5)) %>%
  run() %>% invisible

## ---- trajectory-reneging------------------------------------------------
bank <- trajectory() %>%
  log_("Here I am") %>%
  renege_in(
    5,
    out = trajectory() %>%
      log_("Lost my patience. Reneging...")
  ) %>%
  seize("clerk", 1) %>%
  renege_abort() %>%
  log_("I'm being attended") %>%
  timeout(10) %>%
  release("clerk", 1) %>%
  log_("Finished")

simmer() %>%
  add_resource("clerk", 1) %>%
  add_generator("customer", bank, at(0, 1)) %>%
  run() %>% invisible

## ---- simmer-1-----------------------------------------------------------
env <- simmer() %>%
  add_resource("res_name", 1) %>%
  add_generator("arrival", traj0, function() 25) %>%
  print()

## ---- simmer-2-----------------------------------------------------------
env %>%
  run(until=30)

## ---- mm1-simulation-----------------------------------------------------
library("simmer")

set.seed(1234)

lambda <- 2
mu <- 4
rho <- lambda/mu

mm1.traj <- trajectory() %>%
  seize("mm1.resource", amount=1) %>%
  timeout(function() rexp(1, mu)) %>%
  release("mm1.resource", amount=1)

mm1.env <- simmer() %>%
  add_resource("mm1.resource", capacity=1, queue_size=Inf) %>%
  add_generator("arrival", mm1.traj, function() rexp(1, lambda)) %>%
  run(until=2000)

## ---- mm1-plot, echo=FALSE, eval=requireNamespace("simmer.plot", quietly=TRUE), out.width='.49\\linewidth', fig.height=4, fig.cap='Detail of the resource usage\\label{mm1-plot}.', fig.subcap=c("Instantaneous usage.", "Convergence over time.")----
library("simmer.plot")

mm1.env.res <- get_mon_resources(mm1.env)

plot(mm1.env.res, "usage", "mm1.resource",
     items=c("server", "queue"), steps=TRUE) +
  theme_bw() + xlim(0, 15) + ylim(0, 5) +
  theme(legend.justification=c(0, 1), legend.position=c(0.01, 0.99))

plot(mm1.env.res, "usage", "mm1.resource", items="system") +
  theme_bw() + geom_hline(yintercept=rho/(1-rho)) +
  theme(legend.justification=c(1, 0), legend.position=c(0.99, 0.01))

## ---- mm1-replication----------------------------------------------------
library("simmer")
library("parallel")

set.seed(1234)

mm1.envs <- mclapply(1:100, function(i) {
  simmer() %>%
    add_resource("mm1.resource", capacity=1, queue_size=Inf) %>%
    add_generator("arrival", mm1.traj, function() rexp(100, lambda)) %>%
    run(until=1000/lambda) %>%
    wrap()
}, mc.set.seed=FALSE)

## ---- mm1-replication-test-----------------------------------------------
mm1.data <-
  get_mon_arrivals(mm1.envs) %>%
  aggregate(end_time - start_time ~ replication, data=., mean)

t.test(mm1.data[[2]])

## ---- beep-1-------------------------------------------------------------
beep <- trajectory() %>%
  log_("beeeep!")

env <- simmer() %>%
  add_generator("beep", beep, function() 1) %>%
  run(2.5)

## ---- beep-2-------------------------------------------------------------
alarm <- trajectory() %>%
  timeout(1) %>%
  log_("beeeep!") %>%
  rollback(2)

env <- simmer() %>%
  add_generator("alarm", alarm, at(0)) %>%
  run(2.5)

## ---- xgn----------------------------------------------------------------
xgn <- function(resource, G, n)
  trajectory() %>%
    seize(resource, n) %>%
    timeout(G) %>%
    release(resource, n)

(mm1.traj <- xgn("mm1.resource", function() rexp(1, mu), 1))

## ---- best-coding--------------------------------------------------------
set.seed(1234)
env <- simmer()

traj <- trajectory() %>%
  log_(function() paste0("Current simulation time: ", now(env)))

env <- env %>%
  add_generator("dummy", traj, at(rexp(1, 1))) %>%
  run()

## ---- performance-mm1-simmer, eval=FALSE---------------------------------
#  library("simmer")
#  
#  test_mm1_simmer <- function(n, m, mon=FALSE) {
#    mm1 <- trajectory() %>%
#      seize("server", 1) %>%
#      timeout(function() rexp(1, 1.1)) %>%
#      release("server", 1)
#  
#    env <- simmer() %>%
#      add_resource("server", 1, mon=mon) %>%
#      add_generator("customer", mm1, function() rexp(m, 1), mon=mon) %>%
#      run(until=n)
#  }

## ---- performance-mm1-simpy, eval=FALSE----------------------------------
#  rPython::python.exec("
#  import simpy, random, time
#  
#  def test_mm1(n):
#    def exp_source(env, lambd, server, mu):
#        while True:
#            dt = random.expovariate(lambd)
#            yield env.timeout(dt)
#            env.process(customer(env, server, mu))
#  
#    def customer(env, server, mu):
#        with server.request() as req:
#            yield req
#            dt = random.expovariate(mu)
#            yield env.timeout(dt)
#  
#    env = simpy.Environment()
#    server = simpy.Resource(env, capacity=1)
#    env.process(exp_source(env, 1, server, 1.1))
#    env.run(until=n)
#  
#  def benchmark(n, times):
#    results = []
#    for i in range(0, times):
#      start = time.time()
#      test_mm1(n)
#      results.append(time.time() - start)
#    return results
#  ")

## ---- performance-mm1-simjulia, eval=FALSE-------------------------------
#  rjulia::julia_init()
#  rjulia::julia_void_eval("
#  using SimJulia, Distributions
#  
#  function test_mm1(n::Float64)
#    function exp_source(env::Environment, lambd::Float64,
#                        server::Resource, mu::Float64)
#      while true
#        dt = rand(Exponential(1/lambd))
#        yield(Timeout(env, dt))
#        Process(env, customer, server, mu)
#      end
#    end
#  
#    function customer(env::Environment, server::Resource, mu::Float64)
#      yield(Request(server))
#      dt = rand(Exponential(1/mu))
#      yield(Timeout(env, dt))
#      yield(Release(server))
#    end
#  
#    env = Environment()
#    server = Resource(env, 1)
#    Process(env, exp_source, 1.0, server, 1.1)
#    run(env, n)
#  end
#  
#  function benchmark(n::Float64, times::Int)
#    results = Float64[]
#    test_mm1(n)
#    for i = 1:times
#      push!(results, @elapsed test_mm1(n))
#    end
#    return(results)
#  end
#  ")

## ---- performance-mm1-ref, eval=FALSE------------------------------------
#  n <- 1e4L
#  times <- 20
#  
#  ref <- data.frame(
#    SimPy = rPython::python.call("benchmark", n, times),
#    SimJulia = rjulia::j2r(paste0("benchmark(", n, ".0, ", times, ")"))
#  )

## ---- performance-mm1-plot, echo=FALSE, out.width='.49\\linewidth', fig.cap='Performance comparison.', fig.subcap=c('Boxplots for 20 runs of the M/M/1 test with \\code{n=1e4}.\\label{performance-mm1-init}', 'Performance evolution with the batch size $m$.\\label{performance-mm1-plot}')----
knitr::include_graphics(c("includes/jss-benchmark-boxplot.pdf", "includes/jss-benchmark-batched.pdf"))

## ---- performance-simmer-------------------------------------------------
library("simmer")

test_simmer <- function(n, delay) {
  test <- trajectory() %>%
    timeout(delay)

  env <- simmer() %>%
    add_generator("test", test, at(1:n)) %>%
    run(Inf)

  arrivals <- get_mon_arrivals(env)
}

## ---- performance-R, eval=FALSE------------------------------------------
#  test_R_for <- function(n) {
#    name <- character(n)
#    start_time <- numeric(n)
#    end_time <- numeric(n)
#    activity_time <- logical(n)
#    finished <- numeric(n)
#  
#    for (i in 1:n) {
#      name[i] <- paste0("test", i-1)
#      start_time[i] <- i
#      end_time[i] <- i+1
#      activity_time[i] <- 1
#      finished[i] <- TRUE
#    }
#  
#    arrivals <- data.frame(
#      name=name,
#      start_time=start_time,
#      end_time=end_time,
#      activity_time=activity_time,
#      finished=finished,
#      replication = 1
#    )
#  }

## ---- performance-R2, eval=FALSE-----------------------------------------
#  test_R_lapply <- function(n) {
#    as.data.frame(do.call(rbind, lapply(1:n, function(i) {
#      list(
#        name = paste0("test", i - 1),
#        start_time = i,
#        end_time = i + 1,
#        activity_time = 1,
#        finished = TRUE,
#        replication = 1
#      )
#    })))
#  }

