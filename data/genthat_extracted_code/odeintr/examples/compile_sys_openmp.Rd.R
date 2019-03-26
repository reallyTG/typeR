library(odeintr)


### Name: compile_sys_openmp
### Title: Compile ODE system with openmp multi-threading
### Aliases: compile_sys_openmp

### ** Examples

## Not run: 
##D M = 200
##D bistable = '
##D  laplace4(x, dxdt, D);  // parallel 4-point discrete laplacian
##D  #pragma omp parallel for
##D  for (int i = 0; i < N; ++i)
##D    dxdt[i] += a * x[i] * (1 - x[i]) * (x[i] - b);
##D ' # bistable
##D compile_sys_openmp("bistable", bistable, sys_dim = M * M,
##D                    pars = c(D = 0.1, a = 1.0, b = 1/2),
##D                    const = TRUE)
##D at = 10 ^ (0:3)
##D inic = rbinom(M * M, 1, 1/2)
##D system.time({x = bistable_at(inic, at)})
##D par(mfrow = rep(2, 2), mar = rep(1, 4), oma = rep(1, 4))
##D for (i in 1:4){
##D   image(matrix(unlist(x[i, -1]), M, M),
##D         asp = 1, col = c("black", "lightgray"),
##D         axes = FALSE)
##D   title(main=paste("Time =", x[i, 1]))}
## End(Not run)




