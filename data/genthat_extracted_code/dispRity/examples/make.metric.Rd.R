library(dispRity)


### Name: make.metric
### Title: Creating disparity metrics
### Aliases: make.metric

### ** Examples

## A dimension-level 1 function
my_fun <- function(x) sum(x)
make.metric(my_fun)

## A dimension-level 2 function
my_fun <- function(x) apply(x, 2, sum)
make.metric(my_fun)

## A dimension-level 3 function
my_fun <- function(x) (x + sum(x))
make.metric(my_fun)




