library(ff)


### Name: ramorder.default
### Title: Sorting: order R vector in-RAM and in-place
### Aliases: ramorder.default mergeorder.default radixorder.default
###   keyorder.default shellorder.default
### Keywords: univar manip arith

### ** Examples

   n <- 50
   x <- sample(c(NA, NA, 1:26), n, TRUE)
   order(x)
   i <- 1:n
   ramorder(x, i)
   i
   x[i]

   ## Not run: 
##D       message("Note how the datatype influences sorting speed")
##D       n <- 1e7
##D       x <- sample(1:26, n, TRUE)
##D 
##D       y <- as.double(x)
##D       i <- 1:n
##D       system.time(ramorder(y, i))
##D 
##D       y <- as.integer(x)
##D       i <- 1:n
##D       system.time(ramorder(y, i))
##D 
##D       y <- as.short(x)
##D       i <- 1:n
##D       system.time(ramorder(y, i))
##D 
##D       y <- factor(letters)[x]
##D       i <- 1:n
##D       system.time(ramorder(y, i))
##D    
## End(Not run)



