library(quickPlot)


### Name: whereInStack
### Title: Find the environment in the call stack that contains an object
###   by name
### Aliases: whereInStack

### ** Examples

b <- 1
inner <- function(y) {
  objEnv <- whereInStack("b")
  get("b", envir = objEnv)
}
findB <- function(x) {
  b <- 2
  inner()
}
findB() # Finds 2 because it is looking up the call stack, i.e., the user's perspective

# defined outside of findB2, so its enclosing environment is the same as findB2
innerGet <- function(y) {
   get("b")
}
findB2 <- function(x) {
  b <- 2
  innerGet()
}
findB2() # Finds 1 because b has a value of 1 in the enclosing environment of innerGet
b <- 3
findB2() # Finds 3 because b has a value of 3 in the enclosing environment of innerGet,
         #  i.e., the environment in which innerGet was defined
findB() # Still finds 2 because the call stack hasn't changed

# compare base::dynGet
findB3 <- function(x) {
  b <- 2
  dynGet("b")
}
findB3() # same as findB(), but marginally faster, because it omits the stripping on
         #   sub elements that may be part of the name argument


b <- list()
findB3 <- function(x) {
  b$a <- 2
  dynGet("b$a")
}
testthat::expect_error(findB3()) # fails because not an object name

findB <- function(x) {
  b$a <- 2
  env <- whereInStack("b$a")
  env
}
findB() # finds it




