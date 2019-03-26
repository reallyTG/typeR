library(subcopem2D)


### Name: Bcopula
### Title: Bernstein Copula Approximation
### Aliases: Bcopula
### Keywords: Bcopula

### ** Examples

## (X,Y) continuous random variables with copula FGM(param = 1)

# Theoretical formulas
FGMcopula <- function(u, v) u*v*(1 + (1 - u)*(1 - v))
dFGM.du <- function(u, v) (2*u - 1)*(v^2) + 2*v*(1 - u)
dFGM.dv <- function(u, v) (2*v - 1)*(u^2) + 2*u*(1 - v)
A1 <- function(u) 2*(1 - u)
A2 <- function(u, z) sqrt(A1(u)^2 - 4*(A1(u) - 1)*z)
dFGM.du.inv <- function(u, z) 2*z/(A1(u) + A2(u, z))
FGMdensity <- function(u, v) 2*(1 - u - v + 2*u*v)

# Simulating FGM observations
n <- 3000
U <- runif(n)
Z <- runif(n)
V <- mapply(dFGM.du.inv, U, Z)

# Applying Bcopula to FGM simulated values
B <- Bcopula(cbind(U, V), 50, TRUE)
str(B)

# Comparing theoretical values versus Bernstein and Bilinear approximations
u <- 0.70; v <- 0.55
FGMcopula(u, v); B[["copula"]](u, v); B[["bilinearCopula"]](u, v)
dFGM.du(u, v); B[["du"]](u, v)
dFGM.dv(u, v); B[["dv"]](u, v)
dFGM.du.inv(u, 0.8); B[["du.inv"]](u, 0.8)
FGMdensity(u, v); B[["density"]](u, v)



