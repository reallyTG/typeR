## ---- fig.show='hold'----------------------------------------------------
library(EvolutionaryGames)
ESS(matrix(c(-1, 4, 0, 2), 2, byrow=TRUE), c("Hawk", "Dove"))
ESS(matrix(c(-1, 4, 0, 2), 2, byrow=TRUE), c("Hawk", "Dove"), FALSE)

## ---- fig.show='hold'----------------------------------------------------
library(EvolutionaryGames)
(A <- matrix(c(1, 2, 0, 0, 1, 2, 2, 0, 1), 3, byrow=T))
ESS(A, c("Rock", "Scissors", "Paper"))

## ---- fig.show='hold'----------------------------------------------------
library(EvolutionaryGames)
A <- matrix(c(-2, 5, 10/9, 0, 5/2, 10/9, -10/9, 35/9, 10/9), 3, byrow=TRUE)
strategies <- c("Hawk", "Dove", "Mixed ESS")
ESS(A, strategies)
ESset(A, strategies)

## ---- fig.show='hold'----------------------------------------------------
library(EvolutionaryGames)
A <- matrix(c(-1, 4, 0, 2), 2, byrow=TRUE)
phaseDiagram2S(A, Replicator, strategies = c("Hawk", "Dove"))

## ---- fig.show='hold'----------------------------------------------------
library(EvolutionaryGames)
A <- matrix(c(1, 2, 0, 0, 1, 2, 2, 0, 1), 3, byrow=T)
state <- matrix(c(0.7, 0.2, 0.1), 1, 3, byrow=TRUE)
RSP <- c("Rock", "Scissors", "Paper")
phaseDiagram3S(A, Replicator, NULL, state, FALSE, FALSE, strategies = RSP)
phaseDiagram3S(A, Replicator, NULL, state, TRUE, FALSE, strategies = RSP)
phaseDiagram3S(A, Replicator, NULL, state, TRUE, TRUE, strategies = RSP)

## ---- fig.show='hold'----------------------------------------------------
library(EvolutionaryGames)
A <- matrix(c(5, -9, 6, 8, 20, 1, 2, -18, -14, 0, 2, 20, 13, 0, 4, -13), 4, 4, byrow=TRUE)
state <- c(0.6, 0.15, 0.1, 0.15)
phaseDiagram4S(A, Smith, NULL, state, noRGL=TRUE)

## ---- fig.show='hold'----------------------------------------------------
MyDynamic <- function (time, state, parameters) {
  
#...
  
  return(list (dX))
}

## ---- fig.show='hold'----------------------------------------------------
Replicator <- function (time, state, parameters) {
  
#...
  
  return(list (dX))
}

## ---- fig.show='hold'----------------------------------------------------
Replicator <- function (time, state, parameters) {
  a <- parameters
  states <- sqrt(length(a))
  A <- matrix(a, states, byrow = TRUE)
  A <- t(A) # original symmetric game
  
  return(list (dX))
}

## ---- fig.show='hold'----------------------------------------------------
Replicator <- function(time, state, parameters) {
  a <- parameters
  states <- sqrt(length(a))
  A <- matrix(a, states, byrow = TRUE)
  A <- t(A)

  dX <- c()

  for(i in 1:states) {
    dX[i] <- sum(state * A[i, ])
  }

  avgFitness <- sum(dX * state)

  for(i in 1:states) {
    dX[i] <- state[i] * (dX[i] - avgFitness)
  }

  return(list(dX))
}

