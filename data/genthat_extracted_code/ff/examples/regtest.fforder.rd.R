library(ff)


### Name: regtest.fforder
### Title: Sorting: regression tests
### Aliases: regtest.fforder
### Keywords: univar manip arith

### ** Examples

  regtest.fforder()

 ## Not run: 
##D     n <- 5e6
##D     message("performance comparison at n=", n, "")
##D 
##D     message("sorting doubles")
##D     x <- y <- as.double(runif(n))
##D 
##D     x[] <- y
##D     system.time(sort(x))[3]
##D     x[] <- y
##D     system.time(shellsort(x))[3]
##D     x[] <- y
##D     system.time(shellsort(x, has.na=FALSE))[3]
##D     x[] <- y
##D     system.time(mergesort(x))[3]
##D     x[] <- y
##D     system.time(mergesort(x, has.na=FALSE))[3]
##D 
##D     x[] <- y
##D     system.time(sort(x, decreasing=TRUE))[3]
##D     x[] <- y
##D     system.time(shellsort(x, decreasing=TRUE))[3]
##D     x[] <- y
##D     system.time(shellsort(x, decreasing=TRUE, has.na=FALSE))[3]
##D     x[] <- y
##D     system.time(mergesort(x, decreasing=TRUE))[3]
##D     x[] <- y
##D     system.time(mergesort(x, decreasing=TRUE, has.na=FALSE))[3]
##D 
##D 
##D     x <- y <- as.double(sample(c(rep(NA, n/2), runif(n/2))))
##D 
##D     x[] <- y
##D     system.time(sort(x))[3]
##D     x[] <- y
##D     system.time(shellsort(x))[3]
##D     x[] <- y
##D     system.time(mergesort(x))[3]
##D 
##D     x[] <- y
##D     system.time(sort(x, decreasing=TRUE))[3]
##D     x[] <- y
##D     system.time(shellsort(x, decreasing=TRUE))[3]
##D     x[] <- y
##D     system.time(mergesort(x, decreasing=TRUE))[3]
##D 
##D 
##D 
##D     x <- y <- sort(as.double(runif(n)))
##D 
##D     x[] <- y
##D     system.time(sort(x))  # only here R is faster because R checks for beeing sorted
##D     x[] <- y
##D     system.time(shellsort(x))[3]
##D     x[] <- y
##D     system.time(shellsort(x, has.na=FALSE))[3]
##D     x[] <- y
##D     system.time(mergesort(x))[3]
##D     x[] <- y
##D     system.time(mergesort(x, has.na=FALSE))[3]
##D 
##D     x[] <- y
##D     system.time(sort(x, decreasing=TRUE))[3]
##D     x[] <- y
##D     system.time(shellsort(x, decreasing=TRUE))[3]
##D     x[] <- y
##D     system.time(shellsort(x, decreasing=TRUE, has.na=FALSE))[3]
##D     x[] <- y
##D     system.time(mergesort(x, decreasing=TRUE))[3]
##D     x[] <- y
##D     system.time(mergesort(x, decreasing=TRUE, has.na=FALSE))[3]
##D 
##D     y <- rev(y)
##D     x[] <- y
##D     system.time(sort(x))[3]
##D     x[] <- y
##D     system.time(shellsort(x))[3]
##D     x[] <- y
##D     system.time(shellsort(x, has.na=FALSE))[3]
##D     x[] <- y
##D     system.time(mergesort(x))[3]
##D     x[] <- y
##D     system.time(mergesort(x, has.na=FALSE))[3]
##D 
##D     x[] <- y
##D     system.time(sort(x, decreasing=TRUE))[3]
##D     x[] <- y
##D     system.time(shellsort(x, decreasing=TRUE))[3]
##D     x[] <- y
##D     system.time(shellsort(x, decreasing=TRUE, has.na=FALSE))[3]
##D     x[] <- y
##D     system.time(mergesort(x, decreasing=TRUE))[3]
##D     x[] <- y
##D     system.time(mergesort(x, decreasing=TRUE, has.na=FALSE))[3]
##D 
##D     rm(x,y)
##D 
##D 
##D     message("ordering doubles")
##D 
##D     x <- as.double(runif(n))
##D     system.time(order(x))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i, stabilize=TRUE))[3]
##D     i <- 1:n
##D     system.time(mergeorder(x, i))[3]
##D 
##D     x <- as.double(sample(c(rep(NA, n/2), runif(n/2))))
##D     system.time(order(x))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i, stabilize=TRUE))[3]
##D     i <- 1:n
##D     system.time(mergeorder(x, i))[3]
##D 
##D     x <- as.double(sort(runif(n)))
##D     system.time(order(x))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i, stabilize=TRUE))[3]
##D     i <- 1:n
##D     system.time(mergeorder(x, i))[3]
##D 
##D     x <- rev(x)
##D     system.time(order(x))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i, stabilize=TRUE))[3]
##D     i <- 1:n
##D     system.time(mergeorder(x, i))[3]
##D 
##D 
##D     x <- as.double(runif(n))
##D     system.time(order(x, decreasing=TRUE))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i, decreasing=TRUE))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i, decreasing=TRUE, stabilize=TRUE))[3]
##D     i <- 1:n
##D     system.time(mergeorder(x, i, decreasing=TRUE))[3]
##D 
##D     x <- as.double(sample(c(rep(NA, n/2), runif(n/2))))
##D     system.time(order(x, decreasing=TRUE))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i, decreasing=TRUE))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i, decreasing=TRUE, stabilize=TRUE))[3]
##D     i <- 1:n
##D     system.time(mergeorder(x, i, decreasing=TRUE))[3]
##D 
##D     x <- as.double(sort(runif(n)))
##D     system.time(order(x, decreasing=TRUE))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i, decreasing=TRUE))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i, decreasing=TRUE, stabilize=TRUE))[3]
##D     i <- 1:n
##D     system.time(mergeorder(x, i, decreasing=TRUE))[3]
##D 
##D     x <- rev(x)
##D     system.time(order(x, decreasing=TRUE))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i, decreasing=TRUE))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i, decreasing=TRUE, stabilize=TRUE))[3]
##D     i <- 1:n
##D     system.time(mergeorder(x, i, decreasing=TRUE))[3]
##D 
##D 
##D     keys <- c("short","ushort")
##D     for (v in c("integer", keys)){
##D 
##D       if (v %in% keys){
##D         k <- .vmax[v]-.vmin[v]+1L
##D         if (is.na(.vNA[v])){
##D           y <- sample(c(rep(NA, k), .vmin[v]:.vmax[v]), n, TRUE)
##D         }else{
##D           y <- sample(.vmin[v]:.vmax[v], n, TRUE)
##D         }
##D       }else{
##D         k <- .Machine$integer.max
##D         y <- sample(k, n, TRUE)
##D       }
##D 
##D       message("sorting ",v)
##D 
##D       x <- y
##D       message("sort(x) ", system.time(sort(x))[3])
##D       x <- y
##D       message("shellsort(x) ", system.time(shellsort(x))[3])
##D       x <- y
##D       message("mergesort(x) ", system.time(mergesort(x))[3])
##D       x <- y
##D       message("radixsort(x) ", system.time(radixsort(x))[3])
##D       if (v %in% keys){
##D         x <- y
##D         message("keysort(x) ", system.time(keysort(x))[3])
##D         x <- y
##D         message("keysort(x, keyrange=c(.vmin[v],.vmax[v])) "
##D , system.time(keysort(x, keyrange=c(.vmin[v],.vmax[v])))[3])
##D       }
##D 
##D       if (!is.na(.vNA[v])){
##D         x <- y
##D         message("shellsort(x, has.na=FALSE) ", system.time(shellsort(x, has.na=FALSE))[3])
##D         x <- y
##D         message("mergesort(x, has.na=FALSE) ", system.time(mergesort(x, has.na=FALSE))[3])
##D         x <- y
##D         message("radixsort(x, has.na=FALSE) ", system.time(radixsort(x, has.na=FALSE))[3])
##D         if (v %in% keys){
##D           x <- y
##D           message("keysort(x, has.na=FALSE) ", system.time(keysort(x, has.na=FALSE))[3])
##D           x <- y
##D           message("keysort(x, has.na=FALSE, keyrange=c(.vmin[v],.vmax[v])) "
##D , system.time(keysort(x, has.na=FALSE, keyrange=c(.vmin[v],.vmax[v])))[3])
##D         }
##D       }
##D 
##D 
##D       message("ordering",v)
##D 
##D       x[] <- y
##D       i <- 1:n
##D       message("order(x) ", system.time(order(x))[3])
##D       x[] <- y
##D       i <- 1:n
##D       message("shellorder(x, i) ", system.time(shellorder(x, i))[3])
##D       x[] <- y
##D       i <- 1:n
##D       message("mergeorder(x, i) ", system.time(mergeorder(x, i))[3])
##D       x[] <- y
##D       i <- 1:n
##D       message("radixorder(x, i) ", system.time(radixorder(x, i))[3])
##D       if (v %in% keys){
##D         x[] <- y
##D         i <- 1:n
##D         message("keyorder(x, i) ", system.time(keyorder(x, i))[3])
##D         x[] <- y
##D         i <- 1:n
##D         message("keyorder(x, i, keyrange=c(.vmin[v],.vmax[v])) "
##D , system.time(keyorder(x, i, keyrange=c(.vmin[v],.vmax[v])))[3])
##D       }
##D 
##D       if (!is.na(.vNA[v])){
##D         x[] <- y
##D         i <- 1:n
##D         message("shellorder(x, i, has.na=FALSE) ", system.time(shellorder(x, i, has.na=FALSE))[3])
##D         x[] <- y
##D         i <- 1:n
##D         message("mergeorder(x, i, has.na=FALSE) ", system.time(mergeorder(x, i, has.na=FALSE))[3])
##D         x[] <- y
##D         i <- 1:n
##D         message("radixorder(x, i, has.na=FALSE) ", system.time(radixorder(x, i, has.na=FALSE))[3])
##D         if (v %in% keys){
##D           x[] <- y
##D           i <- 1:n
##D           message("keyorder(x, i, has.na=FALSE) ", system.time(keyorder(x, i, has.na=FALSE))[3])
##D           x[] <- y
##D           i <- 1:n
##D           message("keyorder(x, i, has.na=FALSE, keyrange=c(.vmin[v],.vmax[v])) "
##D , system.time(keyorder(x, i, has.na=FALSE, keyrange=c(.vmin[v],.vmax[v])))[3])
##D         }
##D       }
##D 
##D     }
##D   
## End(Not run)



