library(future.batchtools)


### Name: future.batchtools
### Title: future.batchtools: A Future for batchtools
### Aliases: future.batchtools future.batchtools-package

### ** Examples

## No test: 
plan(batchtools_local)
demo("mandelbrot", package = "future", ask = FALSE)
## End(No test)

## Use local batchtools futures
plan(batchtools_local)

## A global variable
a <- 1

v %<-% {
  b <- 3
  c <- 2
  a * b * c
}

print(v)



