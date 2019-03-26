library(ff)


### Name: ramsort.default
### Title: Sorting: Sort R vector in-RAM and in-place
### Aliases: ramsort.default mergesort.default radixsort.default
###   keysort.default shellsort.default
### Keywords: univar manip arith

### ** Examples

   n <- 50
   x <- sample(c(NA, NA, 1:26), n, TRUE)
   sort(x)
   ramsort(x)
   x

   ## Not run: 
##D       message("Note how the datatype influences sorting speed")
##D       n <- 5e6
##D       x <- sample(1:26, n, TRUE)
##D 
##D       y <- as.double(x)
##D       system.time(ramsort(y))
##D 
##D       y <- as.integer(x)
##D       system.time(ramsort(y))
##D 
##D       y <- as.short(x)
##D       system.time(ramsort(y))
##D 
##D       y <- as.factor(letters)[x]
##D       system.time(ramsort(y))
##D    
## End(Not run)



