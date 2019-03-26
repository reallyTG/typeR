library(mRMRe)


### Name: set.thread.count
### Title: openMP Thread Count
### Aliases: set.thread.count
### Keywords: methods

### ** Examples

# Access to number of available threads
threads <- get.thread.count()
# Force a single threaded openMP job
set.thread.count(1)

# Revert back to all accessible threads
set.thread.count(threads)



