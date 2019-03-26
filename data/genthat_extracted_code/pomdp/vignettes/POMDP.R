## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library("pomdp")

## ------------------------------------------------------------------------
str(args(POMDP))

## ---- eval = FALSE-------------------------------------------------------
#  discount = 0.9

## ---- eval = FALSE-------------------------------------------------------
#  states = c("state1" , "state2" , "state3")

## ---- eval=FALSE---------------------------------------------------------
#  actions = c("action1" , "action2")

## ---- eval=FALSE---------------------------------------------------------
#  observations = c("obs1" , "obs2")

## ---- eval = FALSE-------------------------------------------------------
#  start = c(0.5 , 0.3 , 0.2)

## ---- eval = FALSE-------------------------------------------------------
#  start = "uniform"

## ---- eval = FALSE-------------------------------------------------------
#  start = 3
#  start = c(1, 3)

## ---- eval = FALSE-------------------------------------------------------
#  start <- "state3"
#  start <- c("state1" , "state3")

## ---- eval = FALSE-------------------------------------------------------
#  start = c("-" , "state2")

## ---- eval = FALSE-------------------------------------------------------
#  transition_prob = data.frame(
#    "action" = c(
#            "action1" , "action1" , "action1",
#            "action1" , "action1" , "action1",
#            "action1" , "action1" , "action1",
#            "action2" , "action2" , "action2",
#            "action2" , "action2" , "action2",
#            "action2" , "action2" , "action2"),
#    "start-state" = c(
#            "state1" , "state1" , "state1",
#            "state2" , "state2" , "state2",
#            "state3" , "state3" , "state3",
#            "state1" , "state1" , "state1",
#            "state2" , "state2" , "state2",
#            "state3" , "state3" , "state3"),
#     "end-state" = c(
#            "state1" , "state2" , "state3",
#            "state1" , "state2" , "state3",
#            "state1" , "state2" , "state3",
#            "state1" , "state2" , "state3",
#            "state1" , "state2" , "state3",
#            "state1" , "state2" , "state3"),
#     "probability" = c(
#            0.1  0.4, 0.5,
#            0,   0.7, 0.3,
#            0.4, 0.4, 0.2,
#            0,   0.6, 0.4,
#            0.1, 0.9, 0,
#            0.7, 0.3, 0)
#      )

## ---- eval = FALSE-------------------------------------------------------
#  transition_prob = list(
#    "action1" = matrix(c(
#        0.1, 0.4, 0.5,
#        0,   0.7, 0.3,
#        0.4, 0.4, 0.2), nrow = 3 , byrow = TRUE) ,
#    "action2" = matrix(c(
#        0,   0.6, 0.4,
#        0.1, 0.9, 0,
#        0.7, 0.3, 0), nrow = 3 , byrow = TRUE))
#  
#  transition_prob = list(
#     "action1" = matrix(c(
#        0.1, 0.4, 0.5,
#        0,   0.7, 0.3,
#        0.4, 0.4, 0.2), nrow = 3 , byrow = TRUE) ,
#      "action2" = "uniform")

## ---- eval = FALSE-------------------------------------------------------
#  observation_prob = data.frame(
#    "action"      = c(     "*",      "*",      "*",      "*",      "*",      "*"),
#    "end-state"   = c("state1", "state1", "state2", "state2", "state3", "state3"),
#    "observation" = c(  "obs1",   "obs2",   "obs1",   "obs2",   "obs1",   "obs2"),
#    "probability" = c(     0.1,      0.9,      0.3,      0.7,      0.4,      0.6))

## ---- eval = FALSE-------------------------------------------------------
#  observation_prob = list(
#    "action1" = matrix(c(0.1, 0.9,
#                         0.3, 0.7,
#                         0.4, 0.6), nrow = 3, byrow = TRUE) ,
#    "action2" = matrix(c(0.1, 0.9,
#                         0.3, 0.7,
#                         0.4, 0.6), nrow = 3, byrow = TRUE))
#  
#  
#  observation_prob = list(
#   "action1" = "uniform",
#   "action2" = matrix(c(0.1, 0.9,
#                        0.3, 0.7,
#                        0.4, 0.6), nrow = 3, byrow = TRUE))

## ---- eval = FALSE-------------------------------------------------------
#  reward = data.frame(
#    "action" = c("action1", "action1", "action1", "action2", "action2", "action2"),
#    "start-state" = c("*", "*", "*", "*", "*", "*"),
#    "end-state" = c("state1", "state2", "state3", "state1", "state2", "state3"),
#    "observation" = c("*", "*", "*", "*", "*", "*") ,
#    "reward" = c(10000, 2000, 50, 150, 2500, 100))

## ---- eval = FALSE-------------------------------------------------------
#  reward = list(
#    "action1" = list(
#       "state1" = matrix(c(1, 2, 3, 4, 5, 6) , nrow = 3 , byrow = TRUE),
#       "state2" = matrix(c(3, 4, 5, 2, 3, 7) , nrow = 3 , byrow = TRUE),
#       "state3" = matrix(c(6, 4, 8, 2, 9, 4) , nrow = 3 , byrow = TRUE)),
#    "action2" = list(
#       "state1" = matrix(c(3, 2, 4, 7, 4, 8) , nrow = 3 , byrow = TRUE),
#       "state2" = matrix(c(0, 9, 8, 2, 5, 4) , nrow = 3 , byrow = TRUE),
#       "state3" = matrix(c(4, 3, 4, 4, 5, 6) , nrow = 3 , byrow = TRUE)))

## ---- eval = FALSE-------------------------------------------------------
#  values = "cost"
#  values = "reward"

## ---- eval = FALSE-------------------------------------------------------
#  name = "Test Problem"

## ------------------------------------------------------------------------
str(args(solve_POMDP))

## ------------------------------------------------------------------------
library("pomdp")

TigerProblem <- POMDP(
  name = "Tiger Problem",
  
  discount = 0.75,
  
  states = c("tiger-left" , "tiger-right"),
  actions = c("listen", "open-left", "open-right"),
  observations = c("tiger-left", "tiger-right"),
  
  start = "uniform",
  
  transition_prob = list(
    "listen" = "identity", 
    "open-left" = "uniform", 
    "open-right" = "uniform"),

  observation_prob = list(
    "listen" = matrix(c(0.85, 0.15, 0.15, 0.85), nrow = 2, byrow = TRUE), 
    "open-left" = "uniform",
    "open-right" = "uniform"),
    
  reward = data.frame(
    "action" = c("listen", "open-left", "open-left", "open-right", "open-right"),
    "start-state" = c("*", "tiger-left", "tiger-right", "tiger-left", "tiger-right"),
    "end-state" = c("*", "*", "*", "*", "*"),
    "observation" = c("*", "*", "*", "*", "*"),
    "reward" = c(-1, -100, 10, 10, -100))
  )
  
TigerProblem

## ------------------------------------------------------------------------
tiger_solved <- solve_POMDP(TigerProblem)
tiger_solved

## ------------------------------------------------------------------------
solution(tiger_solved)

## ----fig.width = 10, fig.asp = .7----------------------------------------
plot(tiger_solved)

## ------------------------------------------------------------------------
alpha <- solution(tiger_solved)$alpha
alpha

plot(NA, xlim = c(0, 1), ylim = c(0, 10), xlab = "Belief space", ylab = "Value function")
for(i in 1:nrow(alpha)) abline(a = alpha[i,1], b= alpha[i,2], col = i)
legend("topright", legend = 1:nrow(alpha), col = 1:nrow(alpha), lwd=1)

