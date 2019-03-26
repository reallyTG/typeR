## ----setup, echo = FALSE----------------------------------
options(width = 60, digits = 4)
knitr::opts_chunk$set(
  echo = TRUE, dpi = 128, message = FALSE, error = FALSE, fig.height = 3.5,
  size = "small")

.def.chunk.hook  <- knitr::knit_hooks$get("chunk")
knitr::knit_hooks$set(chunk = function(x, options) {
  x <- .def.chunk.hook(x, options)
  ifelse(options$size != "normalsize",
         paste0("\\", options$size,"\n\n", x, "\n\n \\normalsize"),
         x)
})

## ----show_call--------------------------------------------
library(DtD)
(S <- BS_call(100, 90, 1, .1, .3))
get_underlying(S, 90, 1, .1, .3)

## ----first_sim--------------------------------------------
# assign parameters
vol <- .1
mu  <- .05
dt  <- .05
V_0 <- 100
t.  <- (1:50 - 1) * dt
D   <- c(rep(80, 27), rep( 70, length(t.) - 27))
r   <- c(rep( 0, 13), rep(.02, length(t.) - 13))

# simulate underlying
set.seed(seed <- 83992673)
V <- V_0 * exp(
  (mu - vol^2/2) * t. + cumsum(c(
    0, rnorm(length(t.) - 1, sd = vol * sqrt(dt)))))

# compute stock price
S <- BS_call(V, D, T. = 1, r, vol)
plot(t., S, type = "l", xlab = "Time", ylab = expression(S[t]))

## ----check_back-------------------------------------------
all.equal(V, get_underlying(S, D, 1, r, vol))

## ----show_sim_gives_same----------------------------------
set.seed(seed) # use same seed
sims <- BS_sim(
  vol = vol, mu = mu, dt = dt, V_0 = V_0, D = D, r = r, T. = 1)

isTRUE(all.equal(sims$V, V))
isTRUE(all.equal(sims$S, S))

## ----use_iterative----------------------------------------
# simulate data
set.seed(52722174)
sims <- BS_sim(
  vol = .2, mu = .05, dt = 1/252, V_0 = 100, r = .01, T. = 1,
  # simulate firm that grows partly by lending
  D = 70 * (1 + .01 * (0:(252 * 4)) / 252))

# the sims data.frame has a time column. We need to pass this
head(sims$time, 6)

# estimate parameters
it_est <- BS_fit(
  S = sims$S, D = sims$D, T. = sims$T, r = sims$r, time = sims$time,
  method = "iterative")
it_est

## ----use_mle----------------------------------------------
mle_est <- BS_fit(
  S = sims$S, D = sims$D, T. = sims$T, r = sims$r, time = sims$time,
  method = "mle")
mle_est

## ----show_diff--------------------------------------------
it_est$est - mle_est$est

## ----show_time--------------------------------------------
library(microbenchmark)
with(sims,
  microbenchmark(
    iter = BS_fit(
      S = S, D = D, T. = T, r = r, time = time, method = "iterative"),
    mle = BS_fit(
      S = S, D = D, T. = T, r = r, time = time, method = "mle"),
    times = 5))

## ----include = FALSE, eval = FALSE------------------------
#  out <- replicate(
#    1000L, {
#      sims <<- BS_sim(
#        vol = .2, mu = .05, dt = 1/252, V_0 = 100, r = .01, T. = 1,
#        # simulate firm that grows partly by lending
#        D = 80 * (1 + .03 * (0:(252 * 1)) / 252))
#  
#      BS_fit(S = sims$S, D = sims$D, T. = sims$T, r = sims$r, time = sims$time)$ests
#    })

## ----show_works_with_uneq_gaps----------------------------
# drop random rows
sims <- sims[sort(sample.int(nrow(sims), 100L)), ]

# the gap lengths are not equal anymore
range(diff(sims$time))

# estimate parameters
BS_fit(
  S = sims$S, D = sims$D, T. = sims$T, r = sims$r, time = sims$time,
  method = "iterative")

