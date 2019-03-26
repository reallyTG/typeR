library(flock)


### Name: is.locked
### Title: Locking/Unlocking
### Aliases: is.locked is.locked,FileLock-method
### Keywords: lock unlock

### ** Examples

## Not run: 
##D require(flock)
##D 
##D file.lock = lock("~/file.lock")
##D # Critical section code goes between here and the unlock call
##D if(is.locked(file.lock)) {
##D    print("Got the lock!")
##D }
##D unlock(file.lock)
## End(Not run)



