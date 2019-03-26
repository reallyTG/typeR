library(ManifoldOptim)


### Name: manifold.optim
### Title: Manifold optimization
### Aliases: manifold.optim moptim

### ** Examples

## Not run: 
##D # ----- Example with objective and gradient written in R -----
##D set.seed(1234)
##D 
##D p <- 5; n <- 150
##D B <- matrix(rnorm(n*n), nrow=n)
##D B <- B + t(B)
##D D <- diag(p:1, p)
##D 
##D tx <- function(x) { matrix(x, n, p) }
##D f <- function(x) { X <- tx(x); Trace( t(X) %*% B %*% X %*% D ) }
##D g <- function(x) { X <- tx(x); 2 * B %*% X %*% D }
##D 
##D mod <- Module("ManifoldOptim_module", PACKAGE = "ManifoldOptim")
##D prob <- new(mod$RProblem, f, g)
##D 
##D x0 <- as.numeric(orthonorm(matrix(rnorm(n*p), nrow=n, ncol=p)))
##D mani.params <- get.manifold.params(IsCheckParams = TRUE)
##D solver.params <- get.solver.params(IsCheckParams = TRUE)
##D mani.defn <- get.stiefel.defn(n, p)
##D 
##D res <- manifold.optim(prob, mani.defn, method = "RTRSR1",
##D 	mani.params = mani.params, solver.params = solver.params, x0 = x0)
##D print(res)
##D head(tx(res$xopt))
## End(Not run)
## Not run: 
##D library(ManifoldOptim)
##D library(RcppArmadillo)
##D 
##D # ----- Example with objective and gradient written in C++ -----
##D set.seed(1234)
##D 
##D p <- 5; n <- 150
##D B <- matrix(rnorm(n*n), nrow=n)
##D B <- B + t(B) # force symmetric
##D D <- diag(p:1, p)
##D 
##D # The Problem class is written in C++. Get a handle to it and set it up from R
##D Rcpp::sourceCpp(code = '
##D //[[Rcpp::depends(RcppArmadillo,ManifoldOptim)]]
##D #include <RcppArmadillo.h>
##D #include <ManifoldOptim.h>
##D 
##D using namespace Rcpp;
##D using namespace arma;
##D 
##D class BrockettProblem : public MatrixManifoldOptimProblem
##D {
##D public:
##D 	BrockettProblem(const arma::mat& B, const arma::mat& D)
##D 	: MatrixManifoldOptimProblem(false, true), m_B(B), m_D(D) { }
##D 
##D 	virtual ~BrockettProblem() { }
##D 
##D 	double objFun(const arma::mat& X) const {
##D 		return arma::trace(X.t() * m_B * X * m_D);
##D 	}
##D 
##D 	arma::mat gradFun(const arma::mat& X) const {
##D 		return 2 * m_B * X * m_D;
##D 	}
##D 
##D 	const arma::mat& GetB() const { return m_B; }
##D 	const arma::mat& GetD() const { return m_D; }
##D 
##D private:
##D 	arma::mat m_B;
##D 	arma::mat m_D;
##D };
##D 
##D RCPP_MODULE(Brockett_module) {
##D 	class_<BrockettProblem>("BrockettProblem")
##D 	.constructor<mat,mat>()
##D 	.method("objFun", &BrockettProblem::objFun)
##D 	.method("gradFun", &BrockettProblem::gradFun)
##D 	.method("GetB", &BrockettProblem::GetB)
##D 	.method("GetD", &BrockettProblem::GetD)
##D 	;
##D }
##D ')
##D 
##D prob <- new(BrockettProblem, B, D)
##D X0 <- orthonorm(matrix(rnorm(n*p), nrow=n, ncol=p))
##D x0 <- as.numeric(X0)
##D tx <- function(x) { matrix(x, n, p) }
##D mani.params <- get.manifold.params(IsCheckParams = TRUE)
##D solver.params <- get.solver.params(DEBUG = 0, Tolerance = 1e-4,
##D 	Max_Iteration = 1000, IsCheckParams = TRUE, IsCheckGradHess = FALSE)
##D mani.defn <- get.stiefel.defn(n, p)
##D 
##D res <- manifold.optim(prob, mani.defn, method = "RTRSR1",
##D 	mani.params = mani.params, solver.params = solver.params, x0 = x0)
##D print(res)
##D head(tx(res$xopt))
## End(Not run)




