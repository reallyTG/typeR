library(spsur)


### Name: dgp_spsur
### Title: Generation of a random dataset with a spatial SUR structure.
### Aliases: dgp_spsur

### ** Examples

####################################
######## CROSS SECTION DATA ########
####################################

####################################
#### Example 1: DGP SLM model
####################################
rm(list = ls()) # Clean memory
Tm <- 1 # Number of time periods
G <- 3 # Number of equations
N <- 50 # Number of spatial elements
p <- 3 # Number of independent variables
Sigma <- matrix(0.3, ncol = G, nrow = G)
diag(Sigma) <- 1
Betas <- c(1,2,3,1,-1,0.5,1,-0.5,2)
lambda <- 0.5 # level of spatial dependence
rho <- 0.0 # spatial autocorrelation error term = 0
#  random coordinates
co <- cbind(runif(N,0,1),runif(N,0,1))
W <- spdep::nb2mat(spdep::knn2nb(spdep::knearneigh(co, k = 5,
                                                   longlat = FALSE)))
DGP <- dgp_spsur(Sigma = Sigma, Betas = Betas,
                 rho = rho, lambda = lambda, Tm = Tm,
                 G = G, N = N, p = p, W = W)
SLM <- spsur3sls(W = W, X = DGP$X, Y = DGP$Y, Tm = Tm, N = N, G = G,
               p = c(3,3,3), type = "slm")
summary(SLM)

####################################
### Example 2: DGP SEM model with Tm>1; G=1 and
### different p for each equation
####################################
## No test: 
## It usually requires 1-2 minutes maximum
rm(list = ls()) # Clean memory
Tm <- 3 # Number of time periods
G <- 1 # Number of equations
N <- 500 # Number of spatial elements
p <- c(2,3,4) # Number of independent variables
Sigma <- matrix(0.8, ncol = Tm, nrow = Tm)
diag(Sigma) <- 1
Betas <- c(1,2,1,2,3,1,2,3,4)
lambda <- 0 # level of spatial dependence = 0
rho <- c(0.2,0.5,0.8) # spatial autocorrelation error terms for each equation
# random coordinates
co <- cbind(runif(N, 0, 1),runif(N, 0, 1))
W <- spdep::nb2mat(spdep::knn2nb(spdep::knearneigh(co, k = 5,
                                                   longlat = FALSE)))
DGP2 <- dgp_spsur(Sigma = Sigma, Betas = Betas, rho = rho, lambda = lambda,
                 Tm = Tm, G = G, N = N, p = p, W = W)
SLM2 <- spsurml(W = W, X = DGP2$X, Y = DGP2$Y, Tm = Tm, N = N, G = G,
               p = c(2,3,4), type = "slm")
summary(SLM2)
SEM2 <- spsurml(W = W, X = DGP2$X, Y = DGP2$Y, Tm = Tm, N = N, G = G,
               p = c(2,3,4), type = "sem")
summary(SEM2)

####################################
#### Example with G>1 and Tm>>1
####################################
## It usually requires 1-2 minutes maximum
rm(list = ls()) # Clean memory
Tm <- 10 # Number of time periods
G <- 3 # Number of equations
N <- 100 # Number of spatial elements
p <- 3 # Number of independent variables
Sigma <- matrix(0.5, ncol = G, nrow = G)
diag(Sigma) <- 1
Betas <- rep(1:3, G)
lambda <- c(0.5, 0.1, 0.8)
rho <- 0.0 # spatial autocorrelation error term = 0
#  random coordinates
co <- cbind(runif(N,0,1),runif(N,0,1))
W <- spdep::nb2mat(spdep::knn2nb(spdep::knearneigh(co, k = 5,
                                                   longlat = FALSE)))
DGP3 <- dgp_spsur(Sigma = Sigma, Betas = Betas, rho = rho, lambda = lambda,
                 Tm = Tm, G = G, N = N, p = p, W = W)
SLM3  <-spsurml(Y= DGP3$Y, X = DGP3$X, G = G, N = N, Tm = Tm,
                  p = p, W = W, type = "slm")
summary(SLM3)

## slm with demeaning

SLM3_dem  <-spsurml(Y= DGP3$Y, X = DGP3$X, G = G, N = N, Tm = Tm,
                  p = p, W = W, type = "slm", demean = TRUE)
summary(SLM3_dem)
## End(No test)




