library(qlcMatrix)


### Name: assocSparse
### Title: Association between columns (sparse matrices)
### Aliases: assocSparse pmi res poi wpmi

### ** Examples

# ----- reasonably fast with large very sparse matrices -----

X <- rSparseMatrix(1e6, 1e6, 1e6, NULL)
system.time(M <- assocSparse(X, method = poi))
length(M@x) / prod(dim(M)) # only one in 1e6 cells non-zero

## Not run: 
##D 
##D # ----- reaching limits of sparsity -----
##D 
##D # watch out: 
##D # with slightly less sparse matrices the result will not be very sparse,
##D # so this will easily fill up your RAM during computation!
##D 
##D X <- rSparseMatrix(1e4, 1e4, 1e6, NULL)
##D system.time(M <- assocSparse(X, method = poi))
##D print(object.size(M), units = "auto") # about 350 Mb
##D length(M@x) / prod(dim(M)) # 30% filled
##D 
##D # most values are low, so it often makes sense 
##D # to remove low values to keep results sparse
##D 
##D M <- drop0(M, tol = 2)
##D print(object.size(M), units = "auto") # reduces to 10 Mb
##D length(M@x) / prod(dim(M)) # down to less than 1% filled
## End(Not run)

# ----- defining new methods -----

# Using the following simple 'div' method is the same as
# using a cosine similarity with a 1-norm, up to a factor nrow(X)

div <- function(o,e) {o/e}
X <- rSparseMatrix(10, 10, 30, NULL)
all.equal(
	assocSparse(X, method = div),
	cosSparse(X, norm = norm1) * nrow(X)
	)

# ----- comparing methods -----

# Compare various methods on random data
# ignore values on diagonal, because different methods differ strongly here
# Note the different behaviour of pointwise mutual information (and division)

X <- rSparseMatrix(1e2, 1e2, 1e3, NULL)

p <- assocSparse(X, method = poi); diag(p) <- 0
r <- assocSparse(X, method = res); diag(r) <- 0
m <- assocSparse(X, method = pmi); diag(m) <- 0
w <- assocSparse(X, method = wpmi); diag(w) <- 0
d <- assocSparse(X, method = div); diag(d) <- 0

pairs(~w@x+p@x+r@x+d@x+m@x, 
  labels=c("weighted pointwise\nmutual information","poisson","residuals","division",
           "pointwise\nmutual\ninformation"), cex = 0.7)





