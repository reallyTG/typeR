library(optismixture)


### Name: batch.estimation
### Title: Two stage estimation, a pilot estimate of mixing alpha and a
###   following importance sampling, with or without control variates
### Aliases: batch.estimation

### ** Examples

library(optismixture)
seed <- 1
p <- 5
rho <- 1/2
gamma <- 2.4
sigma.dvar <- function(rho, p){
   sigma <- matrix(0, p, p)
   for(i in 1:(p-1)){
       for(j in (i+1):p){
           sigma[i,j] <- rho^(abs(i-j))
       }
   }
   sigma <- sigma + t(sigma)
   diag(sigma) <- 1
   return(sigma)
}
sigma <- sigma.dvar(rho, p)
batch.size <- c(10^4, 1002)
j.vec <- 2^-(seq(1,5,1))
eps.status <- 1
eps.safe <- 0.1
## initialization and construct derived parameters
mu <- rep(0, p)
x0 <- matrix(1, 1, p)
x0.mat <- rbind(rep(1,p), rep(-1, p))
j.mat <- data.frame(centerid = rep(1:dim(x0.mat)[1], each = length(j.vec)),
                    variance = rep(j.vec, 2))
J <- dim(j.mat)[1] + 1
eps <- rep(0.1/J, J)
mixture.param <- list(x0 = x0, x0.mat = x0.mat, p = p,
sigma = sigma, gamma = gamma, j.mat = j.mat, J = J)
f <- function(x, j, mixture.param){
    f1 <- function(x, mixture.param){
        x0 <- mixture.param$x0
        gamma <- mixture.param$gamma
        return(sum((x - x0)^2)^(-gamma/2))
    }
    return(apply(x, 1, f1, mixture.param))
}
dq <- function(x, j, mixture.param){
    centerid <- mixture.param$j.mat[j, 1]
    j.param <- mixture.param$j.mat[j, 2]
    return(mvtnorm::dmvnorm(x, mixture.param$x0.mat[centerid,], j.param*diag(mixture.param$p)))
}
dp <- function(x, mixture.param){
    return(mvtnorm::dmvnorm(x, rep(0, mixture.param$p), mixture.param$sigma))
}
rq <- function(n, j, mixture.param){
    centerid <- mixture.param$j.mat[j, 1]
    j.param <- mixture.param$j.mat[j,2]
    return(mvtnorm::rmvnorm(n, mixture.param$x0.mat[centerid, ], j.param*diag(mixture.param$p)))
}
rp <- function(n, mixture.param){
    mu <- rep(0, mixture.param$p)
    sigma <- mixture.param$sigma
    return(mvtnorm::rmvnorm(n, mu, sigma))
}
a <- batch.estimation(seed, batch.size, mixture.param, eps, cv = FALSE,
fname = "f", rpname = "rp", rqname = "rq", dpname = "dp", dqname = "dq")



