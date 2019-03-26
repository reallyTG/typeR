library(future.BatchJobs)


### Name: future.BatchJobs
### Title: future.BatchJobs: A Future for BatchJobs
### Aliases: future.BatchJobs future.BatchJobs-package

### ** Examples

## No test: 
plan(batchjobs_local)
demo("mandelbrot", package="future", ask=FALSE)
## End(No test)

## Use local BatchJobs futures
plan(batchjobs_local)

## A global variable
a <- 1

v %<-% {
  b <- 3
  c <- 2
  a * b * c
}

print(v)



