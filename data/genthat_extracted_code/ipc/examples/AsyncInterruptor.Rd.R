library(ipc)


### Name: AsyncInterruptor
### Title: An interruptor useful for stopping child processes.
### Aliases: AsyncInterruptor
### Keywords: datasets

### ** Examples

library(future)
strategy <- "future::multisession"
plan(strategy)
inter <- AsyncInterruptor$new()
fut <- future({
  for(i in 1:100){
    Sys.sleep(.01)
    inter$execInterrupts()
  }
})
inter$interrupt("Error: Stop Future")
try(value(fut))
inter$destroy()

# Clean up multisession cluster
plan(sequential)




