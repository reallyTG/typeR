library(future.BatchJobs)


### Name: batchjobs_local
### Title: BatchJobs local and interactive futures
### Aliases: batchjobs_local batchjobs_interactive

### ** Examples

## Use local BatchJobs futures
plan(batchjobs_local)

## A global variable
a <- 1

## Create explicit future
f <- future({
  b <- 3
  c <- 2
  a * b * c
})
v <- value(f)
print(v)


## Create implicit future
v %<-% {
  b <- 3
  c <- 2
  a * b * c
}
print(v)



