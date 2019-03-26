library(commandr)


### Name: Operation-class
### Title: Operation: A Simple Command Implementation
### Aliases: class:Operation Operation-class Operation OperationQ
###   eval,Operation-method rev,Operation-method

### ** Examples

  op <- OperationQ(message("hello world"))
  eval(op)

  x <- 2
  op <- OperationQ(x^2, sqrt(x))
  x <- eval(op)
  rop <- rev(op)
  identical(2, eval(rop))



