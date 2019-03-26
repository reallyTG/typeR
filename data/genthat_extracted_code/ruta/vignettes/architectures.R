## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE, 
  fig.height=7, 
  fig.width=7,
  out.width = "480",
  comment = "#>"
)

## ----int-----------------------------------------------------------------
library(magrittr)
library(ruta)

net <- c(1000, 100)
net %>% as_network() %>% print()

## ----structure-----------------------------------------------------------
net <- 
  input() + 
  dense(1000, "relu") + 
  dense(100, "tanh") + 
  dense(1000, "relu") + 
  output("sigmoid")

print(net)
plot(net)

## ----custom--------------------------------------------------------------
act_reg <- layer_keras("activity_regularization", l1 = 0.01)

net <- 
  input() + 
  dense(1000, "relu") + dropout() +
  dense(100, "tanh") + act_reg +
  dense(1000, "relu") + dropout() +
  output("sigmoid")

print(net)
plot(net, log = TRUE, fg = "#30707a", bg = "#e0e6ea")

