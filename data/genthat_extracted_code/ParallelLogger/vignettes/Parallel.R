## ---- echo = FALSE, message = FALSE, warning = FALSE---------------------
library(ParallelLogger)
knitr::opts_chunk$set(
  cache=FALSE,
  comment = "#>",
  error = FALSE,
  tidy = FALSE)

## ------------------------------------------------------------------------
cluster <- makeCluster(numberOfThreads = 3)

## ------------------------------------------------------------------------
fun <- function(x, constant) {
     return (x * constant)
}

## ------------------------------------------------------------------------
x <- 1:3
clusterApply(cluster, x, fun, constant = 2)

## ------------------------------------------------------------------------
doBigJob <- function(largeVector) {
  doTinyJob <- function(x){
    return(x^2)
  }
  cluster <- makeCluster(numberOfThreads = 3)
  clusterApply(cluster, largeVector, doTinyJob)
  stopCluster(cluster)
}

## ------------------------------------------------------------------------
doTinyJob <- function(x){
  return(x^2)
}

doBigJob <- function(largeVector) {
  cluster <- makeCluster(numberOfThreads = 3)
  clusterApply(cluster, largeVector, doTinyJob)
  stopCluster(cluster)
}

## ------------------------------------------------------------------------
stopCluster(cluster)

