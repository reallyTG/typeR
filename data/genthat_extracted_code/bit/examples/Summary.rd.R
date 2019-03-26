library(bit)


### Name: Summary
### Title: Summaries of bit vectors
### Aliases: all.bit any.bit min.bit max.bit range.bit sum.bit summary.bit
###   all.bitwhich any.bitwhich min.bitwhich max.bitwhich range.bitwhich
###   sum.bitwhich summary.bitwhich all.ri any.ri min.ri max.ri range.ri
###   sum.ri summary.ri
### Keywords: classes logic

### ** Examples

  x <- as.bit(c(TRUE, TRUE))
  all(x)
  any(x)
  min(x)
  max(x)
  range(x)
  sum(x)
  summary(x)

  x <- as.bitwhich(c(TRUE, TRUE))
  all(x)
  any(x)
  min(x)
  max(x)
  range(x)
  sum(x)
  summary(x)

 ## Not run: 
##D     n <- .Machine$integer.max
##D     x <- !bit(n)
##D     N <- 1000000L  # batchsize
##D     B <- n %/% N   # number of batches
##D     R <- n %% N    # rest
##D 
##D     message("Batched sum (52.5 sec on Centrino duo)")
##D     system.time({
##D       s <- 0L
##D       for (b in 1:B){
##D         s <- s + sum(x[((b-1L)*N+1L):(b*N)])
##D       }
##D       if (R)
##D         s <- s + sum(x[(n-R+1L):n])
##D     })
##D 
##D     message("Batched sum saving repeated memory allocation for the return vector
##D     (44.4 sec on Centrino duo)")
##D     system.time({
##D       s <- 0L
##D       l <- logical(N)
##D       for (b in 1:B){
##D         .Call("R_bit_extract", x, length(x), ((b-1L)*N+1L):(b*N), l, PACKAGE = "bit")
##D         s <- s + sum(l)
##D       }
##D       if (R)
##D         s <- s + sum(x[(n-R+1L):n])
##D     })
##D 
##D     message("C-coded sum (3.1 sec on Centrino duo)")
##D     system.time(sum(x))
##D  
## End(Not run)



