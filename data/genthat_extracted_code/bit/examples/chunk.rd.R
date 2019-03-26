library(bit)


### Name: chunk
### Title: Chunked range index
### Aliases: chunk chunk.default
### Keywords: data

### ** Examples

  chunk(1, 100, by=30)
  chunk(1, 100, by=30, method="seq")
   ## Not run: 
##D require(foreach)
##D m <- 10000
##D k <- 1000
##D n <- m*k
##D message("Four ways to loop from 1 to n. Slowest foreach to fastest chunk is 1700:1 
##D on a dual core notebook with 3GB RAM\n")
##D z <- 0L; 
##D print(k*system.time({it <- icount(m); foreach (i = it) %do% { z <- i; NULL }}))
##D z
##D 
##D z <- 0L
##D print(system.time({i <- 0L; while (i<n) {i <- i + 1L; z <- i}}))
##D z
##D 
##D z <- 0L
##D print(system.time(for (i in 1:n) z <- i))
##D z
##D 
##D z <- 0L; n <- m*k; 
##D print(system.time(for (ch in chunk(1, n, by=m)){for (i in ch[1]:ch[2])z <- i}))
##D z
##D 
##D message("Seven ways to calculate sum(1:n). 
##D  Slowest foreach to fastest chunk is 61000:1 on a dual core notebook with 3GB RAM\n")
##D print(k*system.time({it <- icount(m); foreach (i = it, .combine="+") %do% { i }}))
##D 
##D z <- 0; 
##D print(k*system.time({it <- icount(m); foreach (i = it) %do% { z <- z + i; NULL }}))
##D z
##D 
##D z <- 0; print(system.time({i <- 0L;while (i<n) {i <- i + 1L; z <- z + i}})); z
##D 
##D z <- 0; print(system.time(for (i in 1:n) z <- z + i)); z
##D 
##D print(system.time(sum(as.double(1:n))))
##D 
##D z <- 0; n <- m*k
##D print(system.time(for (ch in chunk(1, n, by=m)){for (i in ch[1]:ch[2])z <- z + i}))
##D z
##D 
##D z <- 0; n <- m*k
##D print(system.time(for (ch in chunk(1, n, by=m)){z <- z+sum(as.double(ch[1]:ch[2]))}))
##D z
##D    
## End(Not run)



