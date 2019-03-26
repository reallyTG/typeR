library(Rdsm)


### Name: rdsmlock
### Title: Lock/unlock operations.
### Aliases: rdsmlock rdsmunlock

### ** Examples


## Not run: 
##D # unreliable function
##D s <- function(n) {
##D    for (i in 1:n) {
##D       tot[1,1] <- tot[1,1] + 1
##D    }
##D }
##D 
##D library(parallel)
##D c2 <- makeCluster(2)
##D clusterExport(c2,"s")
##D mgrinit(c2)
##D mgrmakevar(c2,"tot",1,1)
##D tot[1,1] <- 0
##D clusterEvalQ(c2,s(1000))
##D tot[1,1]  # should be 2000, but likely far from it
##D 
##D s1 <- function(n) {
##D    require(Rdsm)
##D    for (i in 1:n) {
##D       rdsmlock("totlock")
##D       tot[1,1] <- tot[1,1] + 1
##D       rdsmunlock("totlock")
##D    }
##D }
##D 
##D mgrmakelock(c2,"totlock")
##D tot[1,1] <- 0
##D clusterExport(c2,"s1")
##D clusterEvalQ(c2,s1(1000))
##D tot[1,1]  # will print out 2000, the correct number
## End(Not run)




