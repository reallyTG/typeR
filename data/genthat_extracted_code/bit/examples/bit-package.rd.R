library(bit)


### Name: bit-package
### Title: A class for vectors of 1-bit booleans
### Aliases: bit-package bit print.bit
### Keywords: package classes logic

### ** Examples

  x <- bit(12)                                 # create bit vector
  x                                            # autoprint bit vector
  length(x) <- 16                              # change length
  length(x)                                    # get length
  x[[2]]                                       # extract single element
  x[[2]] <- TRUE                               # replace single element
  x[1:2]                                       # extract parts of bit vector
  x[1:2] <- TRUE                               # replace parts of bit vector
  as.which(x)                                  # coerce bit to subscripts
  x <- as.bit.which(3:4, 4)                    # coerce subscripts to bit
  as.logical(x)                                # coerce bit to logical
  y <- as.bit(c(FALSE, TRUE, FALSE, TRUE))     # coerce logical to bit
  is.bit(y)                                    # test for bit
  !x                                           # boolean NOT
  x & y                                        # boolean AND
  x | y                                        # boolean OR
  xor(x, y)                                    # boolean Exclusive OR
  x != y                                       # boolean unequality (same as xor)
  x == y                                       # boolean equality
  all(x)                                       # aggregate AND
  any(x)                                       # aggregate OR
  min(x)                                       # aggregate MIN (integer version of ALL)
  max(x)                                       # aggregate MAX (integer version of ANY)
  range(x)                                     # aggregate [MIN,MAX]
  sum(x)                                       # aggregate SUM (count of TRUE)
  summary(x)                                   # aggregate count of FALSE and TRUE

  ## Not run: 
##D     message("\nEven for a single boolean operation transforming logical to bit pays off")
##D     n <- 10000000
##D     x <- sample(c(FALSE, TRUE), n, TRUE)
##D     y <- sample(c(FALSE, TRUE), n, TRUE)
##D     system.time(x|y)
##D     system.time({
##D        x <- as.bit(x)
##D        y <- as.bit(y)
##D     })
##D     system.time( z <- x | y )
##D     system.time( as.logical(z) )
##D     message("Even more so if multiple operations are needed :-)")
##D 
##D     message("\nEven for a single set operation transforming subscripts to bit pays off\n")
##D     n <- 10000000
##D     x <- sample(n, n/2)
##D     y <- sample(n, n/2)
##D     system.time( union(x,y) )
##D     system.time({
##D      x <- as.bit.which(x, n)
##D      y <- as.bit.which(y, n)
##D     })
##D     system.time( as.which.bit( x | y ) )
##D     message("Even more so if multiple operations are needed :-)")
##D 
##D     message("\nSome timings WITH memory allocation")
##D     n <- 2000000
##D     l <- sample(c(FALSE, TRUE), n, TRUE)
##D     # copy logical to logical
##D     system.time(for(i in 1:100){  # 0.0112
##D        l2 <- l
##D        l2[1] <- TRUE   # force new memory allocation (copy on modify)
##D        rm(l2)
##D     })/100
##D     # copy logical to bit
##D     system.time(for(i in 1:100){  # 0.0123
##D        b <- as.bit(l)
##D        rm(b)
##D     })/100
##D     # copy bit to logical
##D     b <- as.bit(l)
##D     system.time(for(i in 1:100){  # 0.009
##D        l2 <- as.logical(b)
##D        rm(l2)
##D     })/100
##D     # copy bit to bit
##D     b <- as.bit(l)
##D     system.time(for(i in 1:100){  # 0.009
##D        b2 <- b
##D        b2[1] <- TRUE   # force new memory allocation (copy on modify)
##D        rm(b2)
##D     })/100
##D 
##D 
##D     l2 <- l
##D     # replace logical by TRUE
##D     system.time(for(i in 1:100){
##D        l[] <- TRUE
##D     })/100
##D     # replace bit by TRUE (NOTE that we recycle the assignment  
##D 		 # value on R side == memory allocation and assignment first)
##D     system.time(for(i in 1:100){
##D        b[] <- TRUE
##D     })/100
##D     # THUS the following is faster
##D     system.time(for(i in 1:100){
##D        b <- !bit(n)
##D     })/100
##D 
##D     # replace logical by logical
##D     system.time(for(i in 1:100){
##D        l[] <- l2
##D     })/100
##D     # replace bit by logical
##D     system.time(for(i in 1:100){
##D        b[] <- l2
##D     })/100
##D     # extract logical
##D     system.time(for(i in 1:100){
##D        l2[]
##D     })/100
##D     # extract bit
##D     system.time(for(i in 1:100){
##D        b[]
##D     })/100
##D 
##D     message("\nSome timings WITHOUT memory allocation (Serge, that's for you)")
##D     n <- 2000000L
##D     l <- sample(c(FALSE, TRUE), n, TRUE)
##D     b <- as.bit(l)
##D     # read from logical, write to logical
##D     l2 <- logical(n)
##D     system.time(for(i in 1:100).Call("R_filter_getset", l, l2, PACKAGE="bit")) / 100
##D     # read from bit, write to logical
##D     l2 <- logical(n)
##D     system.time(for(i in 1:100).Call("R_bit_get", b, l2, c(1L, n), PACKAGE="bit")) / 100
##D     # read from logical, write to bit
##D     system.time(for(i in 1:100).Call("R_bit_set", b, l2, c(1L, n), PACKAGE="bit")) / 100
##D 
##D   
## End(Not run)



