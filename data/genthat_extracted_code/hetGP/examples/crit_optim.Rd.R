library(hetGP)


### Name: crit_optim
### Title: Criterion optimization
### Aliases: crit_optim

### ** Examples

###############################################################################
## Bi-variate example (myopic version)
###############################################################################

nvar <- 2 

set.seed(42)
ftest <- function(x, coef = 0.1) return(sin(2*pi*sum(x)) + rnorm(1, sd = coef))

n <- 25 # must be a square
xgrid0 <- seq(0.1, 0.9, length.out = sqrt(n))
designs <- as.matrix(expand.grid(xgrid0, xgrid0))
X <- designs[rep(1:n, sample(1:10, n, replace = TRUE)),]
Z <- apply(X, 1, ftest)

model <- mleHomGP(X, Z, lower = rep(0.1, nvar), upper = rep(1, nvar))

ngrid <- 51
xgrid <- seq(0,1, length.out = ngrid)
Xgrid <- as.matrix(expand.grid(xgrid, xgrid))

preds <- predict(x = Xgrid, object =  model)

## Initial plots
contour(x = xgrid,  y = xgrid, z = matrix(preds$mean, ngrid),
        main = "Predicted mean", nlevels = 20)
points(model$X0, col = 'blue', pch = 20)

crit <- "crit_EI"
crit_grid <- apply(Xgrid, 1, crit, model = model)
filled.contour(x = xgrid, y = xgrid, matrix(crit_grid, ngrid),
               nlevels = 20, color.palette = terrain.colors, 
               main = "Initial criterion landscape",
plot.axes = {axis(1); axis(2); points(model$X0, pch = 20)})

## Sequential crit search
nsteps <- 1 # Increase for better results

for(i in 1:nsteps){
  res <- crit_optim(model, crit = crit, h = 0, control = list(multi.start = 100, maxit = 50))
  newX <- res$par
  newZ <- ftest(newX)
  model <- update(object = model, Xnew = newX, Znew = newZ)
}

## Final plots
contour(x = xgrid,  y = xgrid, z = matrix(preds$mean, ngrid),
        main = "Predicted mean", nlevels = 20)
points(model$X0, col = 'blue', pch = 20)

crit_grid <- apply(Xgrid, 1, crit, model = model)
filled.contour(x = xgrid, y = xgrid, matrix(crit_grid, ngrid),
               nlevels = 20, color.palette = terrain.colors, 
               main = "Final criterion landscape",
plot.axes = {axis(1); axis(2); points(model$X0, pch = 20)})

###############################################################################
## Bi-variate example (look-ahead version)
###############################################################################
## Not run: 
##D   
##D nvar <- 2 
##D 
##D set.seed(42)
##D ftest <- function(x, coef = 0.1) return(sin(2*pi*sum(x)) + rnorm(1, sd = coef))
##D 
##D n <- 25 # must be a square
##D xgrid0 <- seq(0.1, 0.9, length.out = sqrt(n))
##D designs <- as.matrix(expand.grid(xgrid0, xgrid0))
##D X <- designs[rep(1:n, sample(1:10, n, replace = TRUE)),]
##D Z <- apply(X, 1, ftest)
##D 
##D model <- mleHomGP(X, Z, lower = rep(0.1, nvar), upper = rep(1, nvar))
##D 
##D ngrid <- 51
##D xgrid <- seq(0,1, length.out = ngrid)
##D Xgrid <- as.matrix(expand.grid(xgrid, xgrid))
##D 
##D nsteps <- 5 # Increase for more steps
##D 
##D crit <- "crit_EI"
##D 
##D for(i in 1:nsteps){
##D   res <- crit_optim(model, h = 3, crit = crit, control = list(multi.start = 100, maxit = 50))
##D   
##D   # If a replicate is selected
##D   if(!res$path[[1]]$new) print("Add replicate")
##D   
##D   newX <- res$par
##D   newZ <- ftest(newX)
##D   model <- update(object = model, Xnew = newX, Znew = newZ)
##D   
##D   ## Plots 
##D   preds <- predict(x = Xgrid, object =  model)
##D   contour(x = xgrid,  y = xgrid, z = matrix(preds$mean, ngrid),
##D           main = "Predicted mean", nlevels = 20)
##D   points(model$X0, col = 'blue', pch = 20)
##D   points(newX, col = "red", pch = 20)
##D   
##D   crit_grid <- apply(Xgrid, 1, crit, model = model)
##D   filled.contour(x = xgrid, y = xgrid, matrix(crit_grid, ngrid),
##D                  nlevels = 20, color.palette = terrain.colors,
##D   plot.axes = {axis(1); axis(2); points(model$X0, pch = 20)})
##D }
## End(Not run)



