library(h2o)


### Name: zzz
### Title: Shutdown H2O cloud after examples run
### Aliases: zzz

### ** Examples

library(h2o)
h2o.init()
h2o.shutdown(prompt = FALSE)
Sys.sleep(3)



