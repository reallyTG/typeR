library(nat.utils)


### Name: makelock
### Title: Make and remove (NFS safe) lock files
### Aliases: makelock removelock

### ** Examples

makelock(lock<-tempfile())
stopifnot(!makelock(lock))
removelock(lock)



