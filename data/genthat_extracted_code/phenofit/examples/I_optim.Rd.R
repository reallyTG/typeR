library(phenofit)


### Name: I_optim
### Title: Interface of unified optimization functions.
### Aliases: I_optim I_optimx

### ** Examples

library(ggplot2)
library(magrittr)
library(purrr)

# simulate vegetation time-series
fFUN = doubleLog.Beck
par = c(
  mn  = 0.1,
  mx  = 0.7,
  sos = 50,
  rsp = 0.1,
  eos = 250,
  rau = 0.1)
t    <- seq(1, 365, 8)
tout <- seq(1, 365, 1)
y <- fFUN(par, t)

# initial parameter
par0 <- c(
  mn  = 0.15,
  mx  = 0.65,
  sos = 100,
  rsp = 0.12,
  eos = 200,
  rau = 0.12)

objective <- f_goal # goal function
optFUNs   <- c("opt_ucminf", "opt_nlminb", "opt_nlm", "opt_optim") %>% set_names(., .)
prior <- as.matrix(par0) %>% t() %>% rbind(., .)

opt1 <- I_optim(prior, fFUN, y, t, tout, c("BFGS", "ucminf", "nlm", "nlminb"))
opt2 <- I_optimx(prior, fFUN, y, t, tout, c("BFGS", "ucminf", "nlm", "nlminb"))

# microbenchmark::microbenchmark(
#     I_optim(prior, fFUN, y, t, tout, c("BFGS", "ucminf", "nlm", "nlminb")),
#     I_optimx(prior, fFUN, y, t, tout, c("BFGS", "ucminf", "nlm", "nlminb")),
#     times = 2
# )



