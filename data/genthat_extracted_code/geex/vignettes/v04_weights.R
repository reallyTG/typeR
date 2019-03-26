## ------------------------------------------------------------------------
library(geex)
library(dplyr)
set.seed(42)
n <- 1000

data1 <- data_frame(
  ID = 1:n,
  Y_tau = rbinom(n,1,0.2),
  S_star = rbinom(n,1,0.6),
  Y = rbinom(n,1,0.4),
  Z = rbinom(n,1,0.5))

data2 <- data1 %>% group_by(Y_tau, S_star, Y, Z) %>% count()

## ------------------------------------------------------------------------
example <- function(data) {
  function(theta) {
    with(data, 
         c( (1 - Y_tau)*(1 -Z )*(Y - theta[1]),
            (1-Y_tau)*Z*(Y-theta[2]),
             theta[3] - theta[2]*theta[1]))
  }
}

## ------------------------------------------------------------------------
system.time({
results1 <- m_estimate(
  estFUN = example,
  data  = data1,
  root_control = setup_root_control(start = c(.5, .5, .5))
)})

system.time({
  results2 <- m_estimate(
  estFUN = example,
  data  = data2,
  weights = data2$n,
  root_control = setup_root_control(start = c(.5, .5, .5))
)})

## ------------------------------------------------------------------------
roots(results1)
roots(results2)

vcov(results1)
vcov(results2)

