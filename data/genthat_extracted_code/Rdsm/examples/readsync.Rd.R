library(Rdsm)


### Name: readsync
### Title: Syncing file-backed variables.
### Aliases: readsync writesync

### ** Examples

library(parallel)
c2 <- makeCluster(2)
mgrinit(c2)
mgrmakevar(c2,"x",1,1,fs=TRUE)

clusterEvalQ(c2,me <- myinfo$id)
clusterEvalQ(c2,if (me==1) x[1,1] <- 3)
# force update on network
clusterEvalQ(c2,if (me==1) writesync("x"))  
clusterEvalQ(c2,if (me==2) readsync("x"))  
clusterEvalQ(c2,if (me==2) x[1,1])  # should be 3
clusterEvalQ(c2,if (me==2) x[1,1] <- 8)
clusterEvalQ(c2,if (me==2) writesync("x"))  
clusterEvalQ(c2,if (me==1) readsync("x"))  
clusterEvalQ(c2,x[1,1])  # both should yield 8



