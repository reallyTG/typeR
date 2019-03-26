library(geoBayes)


### Name: rsglmm
### Title: Simulation from a spatial model
### Aliases: rsglmm rstrga rsgrf

### ** Examples

## Not run: 
##D n <- 100
##D beta <- c(-2, 1)
##D phi <- .2
##D omg <- .3
##D linkp <- 0
##D ssq <- 1
##D l <- rep(10, n)
##D corrf <- "matern"
##D kappa <- .5
##D family <- "poisson"
##D Xcoord <- runif(n)
##D Ycoord <- runif(n)
##D f <- Xcoord + Ycoord
##D formula <- y|z ~ f
##D mydata <- rsglmm(1, formula, family, weights = l,
##D                  atsample = ~ Xcoord + Ycoord, beta = beta, linkp = linkp,
##D                  phi = phi, omg = omg, kappa = kappa, ssq = ssq,
##D                  corrfcn = corrf, returnGRF = TRUE)
## End(Not run)



