library(future.batchtools)


### Name: batchtools_local
### Title: batchtools local and interactive futures
### Aliases: batchtools_local batchtools_interactive

### ** Examples

## Use local batchtools futures
plan(batchtools_local)

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



