library(ManifoldOptim)


### Name: Product manifold definition
### Title: Product manifold definition
### Aliases: 'Product manifold definition' get.product.defn

### ** Examples

mani.defn1 <- get.product.defn(get.sphere.defn(n=5), get.spd.defn(n=5))
mani.defn2 <- get.product.defn(
    get.stiefel.defn(n=10, p=5),
    get.stiefel.defn(n=7, p=3),
    get.grassmann.defn(n=10, p=5)
)

## Not run: 
##D # --- Estimate jointly: Sigma in SPD manifold and mu in sphere manifold ---
##D library(mvtnorm)
##D n <- 400
##D p <- 3
##D mu.true <- rep(1/sqrt(p), p)
##D Sigma.true <- diag(2,p) + 0.1
##D y <- rmvnorm(n, mean = mu.true, sigma = Sigma.true)
##D 
##D tx <- function(x) {
##D     idx.mu <- 1:p
##D     idx.S <- 1:p^2 + p
##D     mu <- x[idx.mu]
##D     S <- matrix(x[idx.S], p, p)
##D     list(mu = mu, Sigma = S)
##D }
##D f <- function(x) {
##D     par <- tx(x)
##D     -sum(dmvnorm(y, mean = par$mu, sigma = par$Sigma, log = TRUE))
##D }
##D 
##D mod <- Module("ManifoldOptim_module", PACKAGE = "ManifoldOptim")
##D prob <- new(mod$RProblem, f)
##D 
##D mu0 <- diag(1, p)[,1]
##D Sigma0 <- diag(1, p)
##D x0 <- c(mu0, as.numeric(Sigma0))
##D 
##D mani.defn <- get.product.defn(get.sphere.defn(p), get.spd.defn(p))
##D mani.params <- get.manifold.params()
##D solver.params <- get.solver.params(isconvex = TRUE)
##D 
##D res <- manifold.optim(prob, mani.defn, method = "LRBFGS", 
##D     mani.params = mani.params, solver.params = solver.params, x0 = x0)
## End(Not run)




