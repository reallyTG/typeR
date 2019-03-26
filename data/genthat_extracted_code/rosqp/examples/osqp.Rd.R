library(rosqp)


### Name: osqp
### Title: OSQP Solver object
### Aliases: osqp

### ** Examples

## example, adapted from the osqp documentation 
## Not run: 
##D library(rosqp)
##D library(Matrix)
##D set.seed(1)
##D n = 10
##D m = 1000
##D Ad = matrix(0, m, n)
##D Ad[sample(n*m, n*m/2, FALSE)] = runif(n*m/2)
##D x_true = (runif(n) > 0.8) * runif(n) / sqrt(n)
##D b = drop(Ad %*% x_true) + 0.5 * runif(m)
##D gammas = seq(1, 10, length.out = 11)
##D 
##D # % OSQP data
##D P = .sparseDiagonal(2*n+m, c(numeric(n), rep_len(1, m), numeric(n)))
##D q = numeric(2*n+m);
##D A = rbind(cbind(Ad, 
##D                 -Diagonal(m), 
##D                 sparseMatrix(numeric(), numeric(), x=numeric(), dims=c(m, n))),
##D           cbind(Diagonal(n), 
##D                 sparseMatrix(numeric(), numeric(), x=numeric(), dims=c(n, m)), 
##D                 -Diagonal(n)),
##D           cbind(Diagonal(n), 
##D                 sparseMatrix(numeric(), numeric(), x=numeric(), dims=c(n, m)), 
##D                 Diagonal(n))
##D           )
##D l = c(b, rep_len(-Inf, n), numeric(n))
##D u = c(b, numeric(n), rep_len(Inf, n))
##D 
##D model = osqp(P, q, A, l, u, osqpSettings(verbose = FALSE))
##D 
##D res = sapply(gammas, function(gamma) {
##D   q_new = c(numeric(n+m), rep_len(gamma, n))
##D   model$Update(q=q_new)
##D   res = model$Solve()
##D   res$x
##D })
## End(Not run)



