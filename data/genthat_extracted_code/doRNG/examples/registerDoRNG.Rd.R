library(doRNG)


### Name: registerDoRNG
### Title: Registering doRNG for Persistent Reproducible Parallel Foreach
###   Loops
### Aliases: registerDoRNG

### ** Examples

## Don't show: 
options(R_CHECK_RUNNING_EXAMPLES_=TRUE) ## roxygen generated flag
## End(Don't show)


library(doParallel)
cl <- makeCluster(2)
registerDoParallel(cl)

# One can make reproducible loops using the %dorng% operator
r1 <- foreach(i=1:4, .options.RNG=1234) %dorng% { runif(1) }
# or convert %dopar% loops using registerDoRNG
registerDoRNG(1234)
r2 <- foreach(i=1:4) %dopar% { runif(1) }
identical(r1, r2)
stopCluster(cl)

# Registering another foreach backend disables doRNG
cl <- makeCluster(2)
registerDoParallel(cl)
set.seed(1234)
s1 <- foreach(i=1:4) %dopar% { runif(1) }
set.seed(1234)
s2 <- foreach(i=1:4) %dopar% { runif(1) }
identical(s1, s2)
## Don't show: 
 stopifnot(!identical(s1, s2)) 
## End(Don't show)

# doRNG is re-nabled by re-registering it 
registerDoRNG()
set.seed(1234)
r3 <- foreach(i=1:4) %dopar% { runif(1) }
identical(r2, r3)
# NB: the results are identical independently of the task scheduling
# (r2 used 2 nodes, while r3 used 3 nodes)

# argument `once=FALSE` reseeds doRNG's seed at the beginning of each loop 
registerDoRNG(1234, once=FALSE)
r1 <- foreach(i=1:4) %dopar% { runif(1) }
r2 <- foreach(i=1:4) %dopar% { runif(1) }
identical(r1, r2)

# Once doRNG is registered the seed can also be passed as an option to %dopar%
r1.2 <- foreach(i=1:4, .options.RNG=456) %dopar% { runif(1) }
r2.2 <- foreach(i=1:4, .options.RNG=456) %dopar% { runif(1) }
identical(r1.2, r2.2) && !identical(r1.2, r1)
## Don't show: 
 stopifnot(identical(r1.2, r2.2) && !identical(r1.2, r1)) 
## End(Don't show)

stopCluster(cl)




