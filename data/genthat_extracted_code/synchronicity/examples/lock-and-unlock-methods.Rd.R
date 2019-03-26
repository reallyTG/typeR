library(synchronicity)


### Name: lock
### Title: Lock and Unlock a Mutex
### Aliases: lock unlock.shared,boost.mutex-method lock.shared unlock
###   unlock.shared

### ** Examples

m = boost.mutex()
lock(m)
# Some code that needs to be synchronized...
unlock(m)



