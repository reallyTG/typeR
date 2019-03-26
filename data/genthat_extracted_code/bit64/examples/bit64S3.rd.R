library(bit64)


### Name: bit64S3
### Title: Tunrning base R functions into S3 generics for bit64
### Aliases: bit64S3 : :.default :.integer64 is.double is.double.default
###   is.double.integer64 match match.default %in% %in%.default rank
###   rank.default order order.default
### Keywords: methods

### ** Examples

 is.double(as.integer64(1))
	as.integer64(1):9
 match(as.integer64(2), as.integer64(0:3))
 as.integer64(2) %in% as.integer64(0:3)
 
 unique(as.integer64(c(1,1,2)))
 rank(as.integer64(c(1,1,2)))
 
 
 
 
 
 
 order(as.integer64(c(1,NA,2)))
 
 ## Don't show: 
 stopifnot(identical(match(as.integer64(2), as.integer64(0:3)), match(2, 0:3)))
 stopifnot(identical(as.integer64(2) %in% as.integer64(0:3), 2 %in% 0:3))
 
 stopifnot(identical(unique(as.integer64(c(1,1,2))), as.integer64(unique(c(1,1,2)))))
 stopifnot(identical(rank(as.integer64(c(1,1,2))), rank(c(1,1,2))))
 
 
 
 
 
 
 stopifnot(identical(order(as.integer64(c(1,NA,2))), order(c(1,NA,2))))
 stopifnot(identical(order(as.integer64(c(1,NA,2)), decreasing=TRUE), order(c(1,NA,2), decreasing=TRUE)))
 
## End(Don't show)



