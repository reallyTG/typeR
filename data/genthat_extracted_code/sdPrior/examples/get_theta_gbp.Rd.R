library(sdPrior)


### Name: get_theta_gbp
### Title: Find Scale Parameter for Generalised Beta Prime (Half-Cauchy)
###   Hyperprior
### Aliases: get_theta_gbp

### ** Examples

set.seed(123)
require(MASS)
# prior precision matrix (second order differences) 
# of a spline of degree l=3 and with m=20 inner knots
# yielding dim(K)=m+l-1=22
K <- t(diff(diag(22), differences=2))%*%diff(diag(22), differences=2)
# generalised inverse of K
Kinv <- ginv(K)
# covariate x
x <- runif(1)
Z <- matrix(DesignM(x)$Z_B,nrow=1)
theta <- get_theta_gbp(alpha = 0.01, method = "integrate", Z = Z, 
                            c = 3, eps = .Machine$double.eps, Kinv = Kinv)$root

## Not run: 
##D 
##D set.seed(91179)
##D library(BayesX)
##D library(MASS)
##D # prior precision matrix to zambia data set
##D K <- read.gra(system.file("examples/zambia.gra", package="sdPrior"))
##D # generalised inverse of K
##D Kinv <- ginv(K)
##D 
##D # read data
##D dat <- read.table(system.file("examples/zambia_height92.raw", package="sdPrior"), header = TRUE)
##D 
##D # design matrix for spatial component
##D Z <- t(sapply(dat$district, FUN=function(x){1*(x==rownames(K))}))
##D 
##D # get scale parameter
##D theta <- get_theta_gbp(alpha = 0.01, method = "integrate", Z = Z, 
##D                             c = 3, eps = .Machine$double.eps, Kinv = Kinv)$root
## End(Not run) 




