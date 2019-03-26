library(hetGP)


### Name: crit_ICU
### Title: Integrated Contour Uncertainty criterion
### Aliases: crit_ICU

### ** Examples

## Infill criterion example
set.seed(42)
branin <- function(x){
  m <- 54.8104; s <- 51.9496
  if(is.null(dim(x))) x <- matrix(x, nrow = 1)
  xx <- 15 * x[,1] - 5; y <- 15 * x[,2]
  f <- (y - 5.1 * xx^2/(4 * pi^2) + 5 * xx/pi - 6)^2 + 10 * (1 - 1/(8 * pi)) * cos(xx) + 10
  f <- (f - m)/s
  return(f)
}

ftest <- function(x, sd = 0.1){
  if(is.null(dim(x))) x <- matrix(x, nrow = 1)
  return(apply(x, 1, branin) + rnorm(nrow(x), sd = sd))
}

ngrid <- 51; xgrid <- seq(0, 1, length.out = ngrid)
Xgrid <- as.matrix(expand.grid(xgrid, xgrid))
Zgrid <- ftest(Xgrid)

n <- 20
N <- 500
X <- Xgrid[sample(1:nrow(Xgrid), n),]
X <- X[sample(1:n, N, replace = TRUE),]
Z <- ftest(X)
model <- mleHetGP(X, Z, lower = rep(0.001,2), upper = rep(1,2))

# Precalculations for speedup
preds <- predict(model, x = Xgrid)
kxprime <- cov_gen(X1 = model$X0, X2 = Xgrid, theta = model$theta, type = model$covtype)
 
critgrid <- apply(Xgrid, 1, crit_ICU, model = model, Xref = Xgrid,
                  preds = preds, kxprime = kxprime)

filled.contour(matrix(critgrid, ngrid), color.palette = terrain.colors, main = "ICU criterion")




