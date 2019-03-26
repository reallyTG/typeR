library(R.utils)


### Name: whichVector.logical
### Title: Identifies TRUE elements in a logical vector
### Aliases: whichVector.logical whichVector.matrix
### Keywords: methods programming internal

### ** Examples
## Not run: 
##D   # - - - - - - - - - - - - - - - - - - - - - - - - - -
##D # Simulate two large named logical vectors,
##D # one with missing values one without
##D # - - - - - - - - - - - - - - - - - - - - - - - - - -
##D N <- 1e6;
##D 
##D # Vector #1
##D x <- sample(c(TRUE, FALSE), size=N, replace=TRUE);
##D names(x) <- seq_along(x);
##D 
##D # Vector #2
##D y <- x
##D y[sample(N, size=0.1*N)] <- NA;
##D 
##D 
##D # - - - - - - - - - - - - - - - - - - - - - - - - - -
##D # Validate consistency
##D # - - - - - - - - - - - - - - - - - - - - - - - - - -
##D stopifnot(identical(which(x), whichVector(x)));
##D stopifnot(identical(which(y), whichVector(y)));
##D 
##D 
##D # - - - - - - - - - - - - - - - - - - - - - - - - - -
##D # Benchmarking
##D # - - - - - - - - - - - - - - - - - - - - - - - - - -
##D # Number of iterations
##D K <- 5;
##D 
##D t1 <- 0;
##D for (kk in 1:K) {
##D   t1 <- t1 + system.time({ idxs1 <- which(x) });
##D };
##D  
##D t2 <- 0;
##D for (kk in 1:K) {
##D   t2 <- t2 + system.time({ idxs2 <- whichVector(x, na.rm=FALSE) });
##D };
##D  
##D cat(sprintf("whichVector(x, na.rm=FALSE)/which(x): %.2f\n", (t2/t1)[3]));
##D stopifnot(identical(idxs1, idxs2));
##D 
##D 
##D t1 <- 0;
##D for (kk in 1:K) {
##D   t1 <- t1 + system.time({ idxs1 <- which(y) });
##D };
##D  
##D t2 <- 0;
##D for (kk in 1:K) {
##D   t2 <- t2 + system.time({ idxs2 <- whichVector(y) });
##D };
##D  
##D cat(sprintf("whichVector(y)/which(y): %.2f\n", (t2/t1)[3]));
##D stopifnot(identical(idxs1, idxs2));
##D 
##D 
##D  
## End(Not run)


