library(ff)


### Name: dim.ff
### Title: Getting and setting dim and dimorder
### Aliases: dim.ff dim.ffdf dim<-.ff dim<-.ffdf dimorder dimorder.default
###   dimorder.ff_array dimorder.ffdf dimorder<- dimorder<-.ff_array
###   dimorder<-.ffdf
### Keywords: IO data

### ** Examples

  x <- ff(1:12, dim=c(3,4), dimorder=c(2:1))
  y <- x
  dim(y) <- c(4,3)
  dimorder(y) <- c(1:2)
  x
  y
  x[]
  y[]
  x[,bydim=c(2,1)]
  y[,bydim=c(2,1)]

  message("NOTE that x[] like x[,] returns a matrix (respects dimorder),")
  message("while x[1:12] returns a vector IN STORAGE ORDER")
  message("check the following examples twice to make sure you understand this")
  x[,]
  x[]
  as.vector(x[])
  x[1:12]
  rm(x,y); gc()

  ## Don't show: 
    message("some regression test with regard to different dimorders")
    k <- 24
    d <- 3:5
    n <- prod(d)
    for (i in 1:k){
      a <- array(sample(n), dim=sample(d))
      x <- as.ff(a, dimorder=sample(seq_along(d)))
      if (!identical(a[1:n], x[1:n]))
        stop("error in caclulating access positions")
      if (!identical(a[1:dim(a)[1],,], x[1:dim(a)[1],,]))
        stop("error in caclulating access positions")
    }
    rm(x); gc()
  
## End(Don't show)
  ## Not run: 
##D     message("some performance comparison between different dimorders")
##D     n <- 100
##D     m <- 100000
##D     a <- ff(1L,dim=c(n,m))
##D     b <- ff(1L,dim=c(n,m), dimorder=2:1)
##D     system.time(lapply(1:n, function(i)sum(a[i,])))
##D     system.time(lapply(1:n, function(i)sum(b[i,])))
##D     system.time(lapply(1:n, function(i){i<-(i-1)*(m/n)+1; sum(a[,i:(i+m/n-1)])}))
##D     system.time(lapply(1:n, function(i){i<-(i-1)*(m/n)+1; sum(b[,i:(i+m/n-1)])}))
##D     rm(a,b); gc()
##D   
## End(Not run)



