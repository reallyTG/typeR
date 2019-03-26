library(Rdsm)


### Name: Rdsm-package
### Title: Adds a threaded parallel programming paradigm to R.
### Aliases: Rdsm-package Rdsm
### Keywords: parallel computation shared memory threads

### ** Examples

library(parallel)
c2 <- makeCluster(2)  # form 2-thread Snow cluster
mgrinit(c2)  # initialize Rdsm
mgrmakevar(c2,"m",2,2)  # make a 2x2 shared matrix
m[,] <- 3  # 2x2 matrix of all 3s
# example of shared memory:
# at each thread, set id to Rdsm built-in ID variable for that thread
clusterEvalQ(c2,id <- myinfo$id)
clusterEvalQ(c2,m[1,id] <- id^2)  # assignment executed by each thread
m[,]  # top row of m should now be (1,4)

# matrix multiplication; the product u %*% v is computed, product
# placed in w

# note again:  mmul() call will be executed by each thread

mmul <- function(u,v,w) {
   require(parallel)
   # decide which rows of u this thread will work on
   myidxs <- splitIndices(nrow(u),myinfo$nwrkrs)[[myinfo$id]]
   # multiply this thread's part of u with v, placing the product in the
   # corresponding part of w
   w[myidxs,] <- u[myidxs,] %*% v[,]
   invisible(0)  
}

# create test matrices
mgrmakevar(c2,"a",6,2)
mgrmakevar(c2,"b",2,6)
mgrmakevar(c2,"c",6,6)
# give them values
a[,] <- 1:12
b[,] <- 1  # all 1s
clusterExport(c2,"mmul")  # send mmul() to the threads
clusterEvalQ(c2,mmul(a,b,c)) # run the threads
c[,]  # check results



