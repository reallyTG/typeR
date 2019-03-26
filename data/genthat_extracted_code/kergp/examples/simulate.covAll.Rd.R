library(kergp)


### Name: simulate, covAll-method
### Title: Simulation of a 'covAll' Object
### Aliases: simulate,covAll-method

### ** Examples


## -- as in example(kergp) define an argumentwise invariant kernel --

kernFun <- function(x1, x2, par) {
  h <- (abs(x1) - abs(x2)) / par[1]
  S <- sum(h^2)
  d2 <- exp(-S)
  K <- par[2] * d2
  d1 <- 2 * K * S / par[1]   
  attr(K, "gradient") <- c(theta = d1,  sigma2 = d2)
  return(K)
}

covSymGauss <- covMan(kernel = kernFun,
                      hasGrad = TRUE,
                      label = "argumentwise invariant",
                      d = 2,
                      parNames = c("theta", "sigma2"),
                      par = c(theta = 0.5, sigma2 = 2))

## -- simulate a path from the corresponding GP --

nGrid <- 24; n <- nGrid^2; d <- 2
xGrid <- seq(from = -1, to = 1, length.out = nGrid)
Xgrid <- expand.grid(x1 = xGrid, x2 = xGrid)

ySim <- simulate(covSymGauss, X = Xgrid)
contour(x = xGrid, y = xGrid,
        z = matrix(ySim, nrow = nGrid, ncol = nGrid), 
        nlevels = 15)



