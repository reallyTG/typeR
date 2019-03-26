library(ff)


### Name: ffapply
### Title: Apply for ff objects
### Aliases: ffapply ffvecapply ffrowapply ffcolapply
### Keywords: array data

### ** Examples

   message("ffvecapply examples")
   x <- ff(vmode="integer", length=1000)
   message("loop evaluate expression without returning anything")
   ffvecapply(x[i1:i2] <- i1:i2, X=x, VERBOSE=TRUE)
   ffvecapply(x[i1:i2] <- i1:i2, X=x, BATCHSIZE=200, VERBOSE=TRUE)
   ffvecapply(x[i1:i2] <- i1:i2, X=x, BATCHSIZE=199, VERBOSE=TRUE)
   message("lets return the combined expressions as a new ff object")
   ffvecapply(i1:i2, N=length(x), VMODE="integer", RETURN=TRUE, BATCHSIZE=200)
   message("lets return the combined expressions as a new ram object")
   ffvecapply(i1:i2, N=length(x), VMODE="integer", RETURN=TRUE, FF_RETURN=FALSE, BATCHSIZE=200)
   message("lets return the combined expressions in existing ff object x")
   x[] <- 0L
   ffvecapply(i1:i2, N=length(x), VMODE="integer", RETURN=TRUE, FF_RETURN=x, BATCHSIZE=200)
   x
   message("aggregate and collapse")
   ffvecapply(summary(x[i1:i2]), X=x, RETURN=TRUE, CFUN="list", BATCHSIZE=200)
   ffvecapply(summary(x[i1:i2]), X=x, RETURN=TRUE, CFUN="crbind", BATCHSIZE=200)
   ffvecapply(summary(x[i1:i2]), X=x, RETURN=TRUE, CFUN="cmean", BATCHSIZE=200)

   message("how to do colSums with ffrowapply")
   x <- ff(1:10000, vmode="integer", dim=c(1000, 10))
   ffrowapply(colSums(x[i1:i2,,drop=FALSE]), X=x, RETURN=TRUE, CFUN="list", BATCHSIZE=200)
   ffrowapply(colSums(x[i1:i2,,drop=FALSE]), X=x, RETURN=TRUE, CFUN="crbind", BATCHSIZE=200)
   ffrowapply(colSums(x[i1:i2,,drop=FALSE]), X=x, RETURN=TRUE, CFUN="csum", BATCHSIZE=200)

   message("further ffrowapply examples")
   x <- ff(1:10000, vmode="integer", dim=c(1000, 10))
   message("loop evaluate expression without returning anything")
   ffrowapply(x[i1:i2, ] <- i1:i2, X=x, BATCHSIZE=200)
   message("lets return the combined expressions as a new ff object (x unchanged)")
   ffrowapply(2*x[i1:i2, ], X=x, RETURN=TRUE, BATCHSIZE=200)
   message("lets return a single row aggregate")
   ffrowapply(t(apply(x[i1:i2,,drop=FALSE], 1, mean)), X=x, RETURN=TRUE, RETCOL=NULL, BATCHSIZE=200)
   message("lets return a 6 column aggregates")
   y <- ffrowapply( t(apply(x[i1:i2,,drop=FALSE], 1, summary)), X=x
   , RETURN=TRUE, RETCOL=length(summary(0)), BATCHSIZE=200)
   colnames(y) <- names(summary(0))
   y
   message("determine column minima if a complete column does not fit into RAM")
   ffrowapply(apply(x[i1:i2,], 2, min), X=x, RETURN=TRUE, CFUN="pmin", BATCHSIZE=200)

   message("ffapply examples")
   x <- ff(1:720, dim=c(8,9,10))
   dimnames(x) <- dummy.dimnames(x)
   message("apply function with scalar return value")
   apply(X=x[], MARGIN=3:2, FUN=sum)
   apply(X=x[], MARGIN=2:3, FUN=sum)
   ffapply(X=x, MARGIN=3:2, AFUN="sum", RETURN=TRUE, BATCHSIZE=8)
   message("this is what CFUN is based on")
   ffapply(X=x, MARGIN=2:3, AFUN="sum", RETURN=TRUE, CFUN="list", BATCHSIZE=8)

   message("apply functions with vector or array return value currently have limited support")
   apply(X=x[], MARGIN=3:2, FUN=summary)
   message("you must use CFUN, the rest is up to you")
   y <- ffapply(X=x, MARGIN=3:2, AFUN="summary", RETURN=TRUE, CFUN="list", BATCHSIZE=8)
   y
   y[[1]]

   rm(x); gc()



