library(hetGP)


### Name: crit_IMSPE
### Title: Sequential IMSPE criterion
### Aliases: crit_IMSPE

### ** Examples

## One-d toy example

set.seed(42)
ftest <- function(x, coef = 0.1) return(sin(2*pi*x) + rnorm(1, sd = coef))

n <- 9
designs <- matrix(seq(0.1, 0.9, length.out = n), ncol = 1)
X <- matrix(designs[rep(1:n, sample(1:10, n, replace = TRUE)),])
Z <- apply(X, 1, ftest)

prdata <- find_reps(X, Z, inputBounds = matrix(c(0,1), nrow = 2, ncol = 1))
Z <- prdata$Z
plot(prdata$X0[rep(1:n, times = prdata$mult),], prdata$Z, xlab = "x", ylab = "Y")

model <- mleHetGP(X = list(X0 = prdata$X0, Z0 = prdata$Z0, mult = prdata$mult),
                  Z = Z, lower = 0.1, upper = 5)

ngrid <- 501
xgrid <- matrix(seq(0,1, length.out = ngrid), ncol = 1)

## Precalculations
Wijs <- Wij(mu1 = model$X0, theta = model$theta, type = model$covtype)


t0 <- Sys.time()

IMSPE_grid <- apply(xgrid, 1, crit_IMSPE, Wijs = Wijs, model = model)

t1 <- Sys.time()
print(t1 - t0)

plot(xgrid, IMSPE_grid * model$nu_hat, xlab = "x", ylab = "crit_IMSPE values")
abline(v = designs)

###############################################################################
## Bi-variate case

nvar <- 2 

set.seed(2)
ftest <- function(x, coef = 0.1) return(sin(2*pi*sum(x)) + rnorm(1, sd = coef))

n <- 16 # must be a square
xgrid0 <- seq(0.1, 0.9, length.out = sqrt(n))
designs <- as.matrix(expand.grid(xgrid0, xgrid0))
X <- designs[rep(1:n, sample(1:10, n, replace = TRUE)),]
Z <- apply(X, 1, ftest)

prdata <- find_reps(X, Z, inputBounds = matrix(c(0,1), nrow = 2, ncol = 1))
Z <- prdata$Z

model <- mleHetGP(X = list(X0 = prdata$X0, Z0 = prdata$Z0, mult = prdata$mult), Z = Z, 
 lower = rep(0.1, nvar), upper = rep(1, nvar))
ngrid <- 51
xgrid <- seq(0,1, length.out = ngrid)
Xgrid <- as.matrix(expand.grid(xgrid, xgrid))
## Precalculations
Wijs <- Wij(mu1 = model$X0, theta = model$theta, type = model$covtype)
t0 <- Sys.time()

IMSPE_grid <- apply(Xgrid, 1, crit_IMSPE, Wijs = Wijs, model = model)
filled.contour(x = xgrid, y = xgrid, matrix(IMSPE_grid, ngrid),
               nlevels = 20, color.palette = terrain.colors,
               main = "Sequential IMSPE values")



