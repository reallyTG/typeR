library(GrassmannOptim)


### Name: GrassmannOptim
### Title: Grassmann Manifold Optimization
### Aliases: GrassmannOptim
### Keywords: optimize programming package

### ** Examples


objfun <- function(W){value <- f(W); gradient <- Grad(W);
return(list(value=value, gradient=gradient))}

f <- function(W){d <- W$dim[1]; Y<-matrix(W$Qt[,1:d], ncol=d);
return(0.5*sum(diag(t(Y)%*%W$A%*%Y)))}

Grad <- function(W){
Qt <- W$Qt; d <- W$dim[1]; p <- nrow(Qt); grad <- matrix (0, p, p);
Y <- matrix(Qt[,1:d], ncol=d); Y0 <- matrix(Qt[,(d+1):p], ncol=(p-d));
return(t(Y) %*% W$A %*% Y0)}

p=5; d=2; set.seed(234);
a <- matrix(rnorm(p**2), ncol=p); A <- t(a)%*%a;

# Exact Solution
W <- list(Qt=eigen(A)$vectors[,1:p], dim=c(d,p), A=A);
ans <- GrassmannOptim(objfun, W, eps_conv=1e-5, verbose=TRUE);
ans$converged

# Random starting matrix
m<-matrix(rnorm(p**2), ncol=p); m<-t(m)%*%m;
W <- list(Qt=eigen(m)$vectors, dim=c(d,p), A=A);
ans <- GrassmannOptim(objfun, W, eps_conv=1e-5, verbose=TRUE);
plot(ans$fvalues)

# Simulated Annealing
W <- list(dim=c(d,p), A=A);
ans <- GrassmannOptim(objfun, W, sim_anneal=TRUE, max_iter_sa=35, 
verbose=TRUE);

########

set.seed(13); p=8; nobs=200; d=3; sigma=1.5; sigma0=2;

rmvnorm <- function (n, mean = rep(0, nrow(sigma)), sigma = diag(length(mean)))
{	# This function generates random numbers from the multivariate normal - 
	# see library "mvtnorm"
	ev <- eigen(sigma, symmetric = TRUE)
    	retval <- ev$vectors %*% diag(sqrt(ev$values), length(ev$values)) %*% 
	t(ev$vectors)
    	retval <- matrix(rnorm(n * ncol(sigma)), nrow = n) %*% retval;
    	retval <- sweep(retval, 2, mean, "+");
   	colnames(retval) <- names(mean);
    	retval
}

objfun <- function(W){return(list(value=f(W), gradient=Gradient(W)))}

f <- function(W){
Qt <- W$Qt; d <- W$dim[1]; p <- ncol(Qt);	Sigmas <- W$sigmas;
U <- matrix(Qt[,1:d], ncol=d);	V <- matrix(Qt[,(d+1):p], ncol=(p-d));
return(-log(det(t(V)%*%Sigmas$S%*%V))-log(det(t(U)%*%Sigmas$S_res%*%U)))}

Gradient <- function(W)
{Qt <- W$Qt; d <- W$dim[1]; p <- ncol(Qt); Sigmas <- W$sigmas;
U <- matrix(Qt[,1:d], ncol=d); V <- matrix(Qt[,(d+1):p], ncol=(p-d));
terme1 <- solve(t(U)%*%Sigmas$S_res%*%U)%*% t(U)%*%Sigmas$S_res%*%V;
terme2 <- t(U)%*%Sigmas$S%*%V%*%solve(t(V)%*%Sigmas$S%*%V);
return(2*(terme1 - terme2))}

y<-array(runif(n=nobs, min=-2, max=2), c(nobs, 1));
fy<-scale(cbind(y, y^2, y^3),TRUE,FALSE);

#Structured error PFC model;
Gamma<-diag(p)[,c(1:3)]; Gamma0<-diag(p)[,-c(1:3)];
Omega <-sigma^2*matrix(0.5, ncol=3, nrow=3); diag(Omega)<-sigma^2;
Delta<- Gamma%*%Omega%*%t(Gamma) + sigma0^2*Gamma0%*%t(Gamma0);

Err <- t(rmvnorm(n=nobs, mean = rep(0, p), sigma = Delta))
beta <- diag(3*c(1, 0.4, 0.4));
X <- t(Gamma%*%beta%*%t(fy) + Err);

Xc <- scale(X, TRUE, FALSE);
P_F <- fy%*%solve(t(fy)%*%fy)%*%t(fy);
S <- t(Xc)%*%Xc/nobs; S_fit <- t(Xc)%*%P_F%*%Xc/nobs; S_res <- S-S_fit;
sigmas <- list(S=S, S_fit=S_fit, S_res=S_res, p=p, nobs=nobs);

# Random starting matrix;
Qt <- svd(matrix(rnorm(p^2), ncol=p))$u;
W <- list(Qt=Qt, dim=c(d, p), sigmas=sigmas)

ans <- GrassmannOptim(objfun, W, eps_conv=1e-4);
ans$converged;
ans$fvalues;
ans$Qt[,1:3];

# Good starting matrix;
Qt <- svd(S_fit)$u;
W <- list(Qt=Qt, dim=c(d, p), sigmas=sigmas)
ans <- GrassmannOptim(objfun, W, eps_conv=1e-4, verbose=TRUE);
ans$converged;



