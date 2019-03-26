library(Iboot)


### Name: Iboot
### Title: Iterated bootstrap tests and confidence sets for a p-dimensional
###   parameter
### Aliases: Iboot
### Keywords: bootstrap prepivoting weighted bootstrap double bootstrap
###   bootstrap iteration

### ** Examples


####Example 1: mean of a normal with known scale
n <- 20
mu <- 1

set.seed(1)
##contributions obtained from the score function
gr <- rnorm(n, mu) - mu

OBJ.Ib <- Iboot(gradient=gr, B=500, M=500, kB=0.01, alpha=c(0.1, 0.05, 0.01), seed=1)

##critical values for testing H0: mu=1, H1: mu!=1
OBJ.Ib
summary(OBJ.Ib)

#####exceeded number of convex hull condition failures in the outer level (kB=0)
OBJ.Ib <- Iboot(gradient=gr, B=500, M=500, kB=0, alpha=c(0.1, 0.05, 0.01), seed=1)
OBJ.Ib
summary(OBJ.Ib)

## Not run: 
##D ####Example 2: example 1 of Lunardon (2013)
##D n <- 20
##D q <- 10
##D 
##D ##parameter
##D mu <- 0
##D sig2 <- 1
##D rho <- 0.5
##D theta <- c(mu, sig2, rho)
##D 
##D ##function to compute the pairwise score contributions
##D pscore_theta <- function(theta, data) 
##D {
##D 	n <- nrow(data)
##D 	q <- ncol(data)
##D 	mu <- theta[1]
##D 	sig2 <- theta[2]
##D 	rho <- theta[3]
##D 	A <- matrix(rho, q, q)
##D 	diag(A) <- -(q-1)
##D 	A <- A/((1-rho^2)*sig2^2)
##D 	B <- matrix(-(1+rho^2), q, q)
##D 	diag(B) <- 2*rho*(q-1)
##D 	B <- B/(sig2*(1-rho^2)^2)
##D 	x_dot <- apply(data, 1, sum)
##D 	p_mu <- ((q-1)/(sig2*(1+rho)))*(x_dot-q*mu)
##D 	p_sig2 <- -0.5*apply(((data-mu)##D 
##D 	p_rho <- q*(q-1)*rho*0.5/(1-rho^2)-0.5*apply(((data-mu)##D 
##D 	RES <- cbind(p_mu, p_sig2, p_rho)
##D 	colnames(RES) <- c("mu", "sig2", "rho")
##D 	RES
##D }
##D 
##D 
##D ###data simulation
##D 
##D ##correlation matrix
##D S <- matrix(rho*sig2, q, q)
##D diag(S) <- sig2
##D ##cholesky
##D cholS <- chol(S)
##D 
##D ##generation from multivariate normal
##D set.seed(3)
##D Y <- matrix(rnorm(n*q), n, q)##D 
##D 
##D ##compute pairwise score conributions
##D gr <- pscore_theta(theta, Y)
##D 
##D OBJ.Ib <- Iboot(gradient=gr, B=500, M=500, kB=0.01, alpha=c(0.1, 0.05, 0.01), seed=3)
##D 
##D ##critical values for testing H0: theta=(0, 1, 0.5), H1: theta!=(0, 1, 0.5)
##D OBJ.Ib
##D summary(OBJ.Ib)
##D 
##D ##sampe size too small: convex hull failure at the beginning
##D n <- 10
##D set.seed(3)
##D Y <- matrix(rnorm(n*q), n, q)##D 
##D 
##D ##compute pairwise score conributions
##D gr <- pscore_theta(theta, Y)
##D 
##D OBJ.Ib <- Iboot(gradient=gr, B=500, M=500, kB=0.01, alpha=c(0.1, 0.05, 0.01), seed=3)
##D OBJ.Ib
##D summary(OBJ.Ib)
## End(Not run)



