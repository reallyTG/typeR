## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----caRa----------------------------------------------------------------
library(caRamel)

## ----schaffer------------------------------------------------------------
schaffer <- function(i) {
  if (x[i,1] <= 1) {
    s1 <- -x[i,1]
  } else if (x[i,1] <= 3) {
    s1 <- x[i,1] - 2
  } else if (x[i,1] <= 4) {
    s1 <- 4 - x[i,1]
  } else {
    s1 <- x[i,1] - 4
  }
  s2 <- (x[i,1] - 5) * (x[i,1] - 5)
  return(c(s1, s2))
}

## ----schaffer_variable---------------------------------------------------
nvar <- 1 # number of variables
bounds <- matrix(data = 1, nrow = nvar, ncol = 2) # upper and lower bounds
bounds[, 1] <- -5 * bounds[, 1]
bounds[, 2] <- 10 * bounds[, 2]

## ----schaffer_objectives-------------------------------------------------
nobj <- 2 # number of objectives
minmax <- c(FALSE, FALSE) # min and min

## ----schaffer_param------------------------------------------------------
popsize <- 100 # size of the genetic population
archsize <- 100 # size of the archive for the Pareto front
maxrun <- 1000 # maximum number of calls
prec <- matrix(1.e-3, nrow = 1, ncol = nobj) # accuracy for the convergence phase

## ----schaffer_launch, fig.show="hide", results="hide"--------------------
results <-
  caRamel(nobj,
          nvar,
          minmax,
          bounds,
          schaffer,
          popsize,
          archsize,
          maxrun,
          prec,
          carallel=FALSE) # no parallelism

## ----schaffer_OK---------------------------------------------------------
print(results$success==TRUE)

## ----schaffer_plot1------------------------------------------------------
plot(results$objectives[,1], results$objectives[,2], main="Schaffer Pareto front", xlab="Objective #1", ylab="Objective #2")

## ----schaffer_plot2------------------------------------------------------
plot(results$parameters, main="Corresponding values for X", xlab="Element of the archive", ylab="X Variable")

## ----kursawe-------------------------------------------------------------
kursawe <- function(i) {
  k1 <- -10 * exp(-0.2 * sqrt(x[i,1] ^ 2 + x[i,2] ^ 2)) - 10 * exp(-0.2 * sqrt(x[i,2] ^2 + x[i,3] ^ 2))
  k2 <- abs(x[i,1]) ^ 0.8 + 5 * sin(x[i,1] ^ 3) + abs(x[i,2]) ^ 0.8 + 5 * sin(x[i,2] ^3) + abs(x[i,3]) ^ 0.8 + 5 * sin(x[i,3] ^ 3)
  return(c(k1, k2))
}

## ----kursawe_variable----------------------------------------------------
nvar <- 3 # number of variables
bounds <- matrix(data = 1, nrow = nvar, ncol = 2) # upper and lower bounds
bounds[, 1] <- -5 * bounds[, 1]
bounds[, 2] <- 5 * bounds[, 2]

## ----kursawe_objectives--------------------------------------------------
nobj <- 2 # number of objectives
minmax <- c(FALSE, FALSE) # min and min

## ----kursawe_param, fig.show="hide", results="hide"----------------------
popsize <- 100 # size of the genetic population
archsize <- 100 # size of the archive for the Pareto front
maxrun <- 1000 # maximum number of calls
prec <- matrix(1.e-3, nrow = 1, ncol = nobj) # accuracy for the convergence phase

results <- 
  caRamel(nobj,
          nvar,
          minmax,
          bounds,
          kursawe,
          popsize,
          archsize,
          maxrun,
          prec,
          carallel=FALSE) # no parallelism

## ----kursawe_OK_plot-----------------------------------------------------
print(results$success==TRUE)

plot(results$objectives[,1], results$objectives[,2], main="Kursawe Pareto front", xlab="Objective #1", ylab="Objective #2")

## ----kursawe_plot_conv---------------------------------------------------
matplot(results$save_crit[,1],cbind(results$save_crit[,2],results$save_crit[,3]),type="l",col=c("blue","red"), main="Convergence", xlab="Number of calls", ylab="Objectives values")

