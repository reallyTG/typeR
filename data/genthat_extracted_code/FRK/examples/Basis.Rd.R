library(FRK)


### Name: Basis
### Title: Generic basis-function constructor
### Aliases: Basis

### ** Examples

## Construct two linear basis functions on [0, 1]
manifold <- real_line()
n <- 2
lin_basis_fn <- function(manifold, grad, intercept) {
   function(s) grad*s + intercept
}
pars <- list(list(grad = 1, intercept = 0),
             list(grad = -1, intercept = 1))
fn <- list(lin_basis_fn(manifold, 1, 0),
           lin_basis_fn(manifold, -1, 1))
df <- data.frame(n = 1:2, grad = c(1, -1), m = c(1, -1))
G <- Basis(manifold = manifold, n = n, fn = fn, pars = pars, df = df)
## Not run: 
##D eval_basis(G, s = matrix(seq(0,1, by = 0.1), 11, 1))
## End(Not run)



