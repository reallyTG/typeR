library(synchronicity)


### Name: describe
### Title: Create descriptors to mutexes and attach
### Aliases: describe
### Keywords: programming misc

### ** Examples

  m = boost.mutex()
  mm = attach.mutex(describe(m))
  # Now, both m and mm specify the same mutex.
  rm(m)
  rm(mm)
  gc()



