library(bigstatsr)


### Name: big_parallelize
### Title: Split-parApply-Combine
### Aliases: big_parallelize

### ** Examples

## Not run: 
##D  # CRAN is super slow when parallelism.
##D   X <- big_attachExtdata()
##D 
##D   ### Computation on all the matrix
##D   true <- big_colstats(X)
##D 
##D   big_colstats_sub <- function(X, ind) {
##D     big_colstats(X, ind.col = ind)
##D   }
##D   # 1. the computation is split along all the columns
##D   # 2. for each part the computation is done, using `big_colstats`
##D   # 3. the results (data.frames) are combined via `rbind`.
##D   test <- big_parallelize(X, p.FUN = big_colstats_sub,
##D                           p.combine = 'rbind', ncores = 2)
##D   all.equal(test, true)
##D 
##D   ### Computation on a part of the matrix
##D   n <- nrow(X)
##D   m <- ncol(X)
##D   rows <- sort(sample(n, n/2)) # sort to provide some locality in accesses
##D   cols <- sort(sample(m, m/2)) # idem
##D 
##D   true2 <- big_colstats(X, ind.row = rows, ind.col = cols)
##D 
##D   big_colstats_sub2 <- function(X, ind, rows, cols) {
##D     big_colstats(X, ind.row = rows, ind.col = cols[ind])
##D   }
##D   # This doesn't work because, by default, the computation is spread
##D   # along all columns. We must explictly specify the `ind` parameter.
##D   tryCatch(big_parallelize(X, p.FUN = big_colstats_sub2,
##D                            p.combine = 'rbind', ncores = 2,
##D                            rows = rows, cols = cols),
##D            error = function(e) message(e))
##D 
##D   # This now works, using `ind = seq_along(cols)`.
##D   test2 <- big_parallelize(X, p.FUN = big_colstats_sub2,
##D                            p.combine = 'rbind', ncores = 2,
##D                            ind = seq_along(cols),
##D                            rows = rows, cols = cols)
##D   all.equal(test2, true2)
##D 
## End(Not run)



