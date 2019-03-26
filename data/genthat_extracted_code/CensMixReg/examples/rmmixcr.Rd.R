library(CensMixReg)


### Name: rmmixcr
### Title: Random multivariate Finite Mixture Censored generator
### Aliases: rmmixcr
### Keywords: methods

### ** Examples

mu          <- Sigma <- shape <- family <- list()
mu[[1]]     <- c(-3,-1)
mu[[2]]     <- c(2,3)
Sigma[[1]]  <- matrix(c(8,1,1,5.5), 2,2)
Sigma[[2]]  <- matrix(c(2,1,1,2.5), 2,2)
family[[1]] <- "Skew.t"
family[[2]] <- "Skew.normal"
shape[[1]]  <- c(4,5)
shape[[2]]  <- c(1,1)
nu          <- c(3,3)
pii         <- c(0.65,0.35)
percCensu   <- c(0.15,0.15)

data        <- rmmixcr(100, pii , mu , Sigma, shape, nu, percCensu, family)



