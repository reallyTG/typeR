library(ff)


### Name: Extract.ff
### Title: Reading and writing vectors and arrays (high-level)
### Aliases: Extract.ff [.ff [<-.ff [.ff_array [<-.ff_array [[.ff [[<-.ff
### Keywords: IO data array

### ** Examples

   message("look at different dimorders")
   x <- ff(1:12, dim=c(3,4), dimorder=c(1,2))
   x[]
   as.vector(x[])
   x[1:12]
   x <- ff(1:12, dim=c(3,4), dimorder=c(2,1))
   x[]
   as.vector(x[])
   message("Beware (might be changed)")
   x[1:12]

   message("look at different bydim")
   matrix(1:12, nrow=3, ncol=4, byrow=FALSE)
   x <- ff(1:12, dim=c(3,4), bydim=c(1,2))
   x
   matrix(1:12, nrow=3, ncol=4, byrow=TRUE)
   x <- ff(1:12, dim=c(3,4), bydim=c(2,1))
   x
   x[,, bydim=c(2,1)]
   as.vector(x[,, bydim=c(2,1)])
   message("even consistent interpretation of vectors in assignments")
   x[,, bydim=c(1,2)] <- x[,, bydim=c(1,2)]
   x
   x[,, bydim=c(2,1)] <- x[,, bydim=c(2,1)]
   x
   rm(x); gc()

  ## Not run: 
##D    message("some performance implications of different dimorders")
##D    n <- 100
##D    m <- 100000
##D    a <- ff(1L,dim=c(n,m))
##D    b <- ff(1L,dim=c(n,m), dimorder=2:1)
##D    system.time(lapply(1:n, function(i)sum(a[i,])))
##D    system.time(lapply(1:n, function(i)sum(b[i,])))
##D    system.time(lapply(1:n, function(i){i<-(i-1)*(m/n)+1; sum(a[,i:(i+m/n-1)])}))
##D    system.time(lapply(1:n, function(i){i<-(i-1)*(m/n)+1; sum(b[,i:(i+m/n-1)])}))
##D 
##D    n <- 100
##D    a <- ff(1L,dim=c(n,n,n,n))
##D    b <- ff(1L,dim=c(n,n,n,n), dimorder=4:1)
##D    system.time(lapply(1:n, function(i)sum(a[i,,,])))
##D    system.time(lapply(1:n, function(i)sum(a[,i,,])))
##D    system.time(lapply(1:n, function(i)sum(a[,,i,])))
##D    system.time(lapply(1:n, function(i)sum(a[,,,i])))
##D    system.time(lapply(1:n, function(i)sum(b[i,,,])))
##D    system.time(lapply(1:n, function(i)sum(b[,i,,])))
##D    system.time(lapply(1:n, function(i)sum(b[,,i,])))
##D    system.time(lapply(1:n, function(i)sum(b[,,,i])))
##D 
##D    n <- 100
##D    m <- 100000
##D    a <- ff(1L,dim=c(n,m))
##D    b <- ff(1L,dim=c(n,m), dimorder=2:1)
##D    system.time(ffrowapply(sum(a[i1:i2,]), a, RETURN=TRUE, CFUN="csum", BATCHBYTES=16104816%/%20))
##D    system.time(ffcolapply(sum(a[,i1:i2]), a, RETURN=TRUE, CFUN="csum", BATCHBYTES=16104816%/%20))
##D    system.time(ffrowapply(sum(b[i1:i2,]), b, RETURN=TRUE, CFUN="csum", BATCHBYTES=16104816%/%20))
##D    system.time(ffcolapply(sum(b[,i1:i2]), b, RETURN=TRUE, CFUN="csum", BATCHBYTES=16104816%/%20))
##D 
##D    rm(a,b); gc()
##D   
## End(Not run)



