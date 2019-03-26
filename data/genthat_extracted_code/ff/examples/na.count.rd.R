library(ff)


### Name: na.count
### Title: Getting and setting 'na.count' physical attribute
### Aliases: na.count.ff na.count.default na.count<-.ff na.count<-.default
### Keywords: IO data

### ** Examples

  message("--- ff examples ---")
  x <- ff(1:12)
  na.count(x)
  message("activate the 'na.count' physical attribute and set the current na.count manually")
  na.count(x) <- 0L
  message("add one NA with a method that maintains na.count")
  swap(x, NA, 1)
  na.count(x)
  message("remove the 'na.count' physical attribute (and stop automatic maintenance)")
  na.count(x) <- NULL
  message("activate the 'na.count' physical attribute and have ff automatically 
calculate the current na.count")
  na.count(x) <- TRUE
  na.count(x)
  message("--- ram examples ---")
  x <- 1:12
  na.count(x)
  x[1] <- NA
  message("activate the 'na.count' physical attribute and have R automatically 
calculate the current na.count")
  na.count(x) <- TRUE
  na.count(x)
  message("remove the 'na.count' physical attribute (and stop automatic maintenance)")
  na.count(x) <- NULL
  na.count(x)
  rm(x); gc()



