library(sdPrior)


### Name: get_theta
### Title: Find Scale Parameter for (Scale Dependent) Hyperprior
### Aliases: get_theta

### ** Examples

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
##D theta <- get_theta(alpha = 0.01, method = "integrate", Z = Z, 
##D                             c = 3, eps = .Machine$double.eps, Kinv = Kinv)$root
## End(Not run) 




