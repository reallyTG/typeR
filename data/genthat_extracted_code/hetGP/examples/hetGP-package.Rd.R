library(hetGP)


### Name: hetGP-package
### Title: Package hetGP
### Aliases: hetGP-package

### ** Examples

##------------------------------------------------------------
## Example 1: Heteroskedastic GP modeling on the motorcycle data
##------------------------------------------------------------
set.seed(32)

## motorcycle data
library(MASS)
X <- matrix(mcycle$times, ncol = 1)
Z <- mcycle$accel
nvar <- 1
plot(X, Z, ylim = c(-160, 90), ylab = 'acceleration', xlab = "time")

## Model fitting
settings <- list(return.hom = TRUE) # To keep homoskedastic model used for training
model <- mleHetGP(X = X, Z = Z, lower = rep(0.1, nvar), upper = rep(50, nvar),
                  covtype = "Matern5_2", settings = settings)

## A quick view of the fit                  
summary(model)

## Create a prediction grid and obtain predictions
xgrid <- matrix(seq(0, 60, length.out = 301), ncol = 1) 
predictions <- predict(x = xgrid, object =  model)

## Display averaged observations
points(model$X0, model$Z0, pch = 20)

## Display mean predictive surface
lines(xgrid, predictions$mean, col = 'red', lwd = 2)
## Display 95% confidence intervals
lines(xgrid, qnorm(0.05, predictions$mean, sqrt(predictions$sd2)), col = 2, lty = 2)
lines(xgrid, qnorm(0.95, predictions$mean, sqrt(predictions$sd2)), col = 2, lty = 2)
## Display 95% prediction intervals
lines(xgrid, qnorm(0.05, predictions$mean, sqrt(predictions$sd2 + predictions$nugs)), 
  col = 3, lty = 2)
lines(xgrid, qnorm(0.95, predictions$mean, sqrt(predictions$sd2 + predictions$nugs)), 
  col = 3, lty = 2)
  
## Comparison with homoskedastic fit
predictions2 <- predict(x = xgrid, object = model$modHom)
lines(xgrid, predictions2$mean, col = 4, lty = 2, lwd = 2)
lines(xgrid, qnorm(0.05, predictions2$mean, sqrt(predictions2$sd2)), col = 4, lty = 3)
lines(xgrid, qnorm(0.95, predictions2$mean, sqrt(predictions2$sd2)), col = 4, lty = 3)


##------------------------------------------------------------
## Example 2: Sequential design
##------------------------------------------------------------
## Not run: 
##D library(DiceDesign)
##D 
##D ## Design configuration / Parameter settings
##D N_tot <- 500 # total number of points
##D n_init <- 10 # number of unique designs
##D 
##D ## HetGP options
##D nvar <- 1 # number of variables
##D lower <- rep(0.001, nvar)
##D upper <- rep(1, nvar)
##D 
##D ### Problem definition
##D 
##D ## Mean function
##D forrester <- function(x){
##D  return(((x*6-2)^2)*sin((x*6-2)*2))
##D }
##D 
##D ## Noise field via standard deviation
##D noiseFun <- function(x, coef = 1.1, scale = 1){
##D  if(is.null(nrow(x)))
##D    x <- matrix(x, nrow = 1)
##D  return(scale*(coef + sin(x * 2 * pi)))
##D }
##D 
##D ### Test function defined in [0,1]
##D ftest <- function(x){
##D  if(is.null(nrow(x)))
##D    x <- matrix(x, ncol = 1)
##D  return(forrester(x) + rnorm(nrow(x), mean = 0, sd = noiseFun(x)))
##D }
##D 
##D ## Predictive grid
##D ngrid <- 51
##D xgrid <- seq(0,1, length.out = ngrid)
##D Xgrid <- matrix(xgrid, ncol = 1)
##D 
##D par(mar = c(3,3,2,3)+0.1)
##D plot(xgrid, forrester(xgrid), type = 'l', lwd = 1, col = "blue", lty = 3,
##D     xlab = '', ylab = '', ylim = c(-8,16))
##D 
##D set.seed(42)
##D 
##D # Initial design
##D X <- maximinSA_LHS(lhsDesign(n_init, nvar, seed = 42)$design)$design
##D Z <- apply(X, 1, ftest)
##D 
##D points(X, Z)
##D 
##D model <- model_init <- mleHetGP(X = X, Z = Z, lower = lower, upper = upper)
##D 
##D for(ii in 1:(N_tot - n_init)){
##D  ##Precalculations
##D  Wijs <- hetGP:::Wij(mu1 = model$X0, theta = model$theta, type = model$covtype)
##D  
##D  ## Adapt the horizon based on the training rmspe/score
##D    current_horizon <- horizon(model = model, Wijs = Wijs)
##D 
##D  if(current_horizon == -1){
##D    opt <- IMSPE_optim(model = model, h = 0, Wijs = Wijs)
##D  }else{
##D    opt <- IMSPE_optim(model = model, h = current_horizon, Wijs = Wijs)
##D  }
##D  
##D  Xnew <- opt$par
##D  Znew <- apply(Xnew, 1, ftest)
##D  X <- rbind(X, Xnew)
##D  Z <- c(Z, Znew)
##D  points(Xnew, Znew)
##D  
##D  ## Update of the model
##D  model <- update(object = model, Xnew = Xnew, Znew = Znew, lower = lower, upper = upper)
##D  if(ii %% 25 == 0 || ii == (N_tot - n_init)){
##D    model_test <- mleHetGP(X = list(X0 = model$X0, Z0 = model$Z0, mult = model$mult), Z = model$Z,
##D                         lower = lower, upper = upper, maxit = 1000)
##D    model <- compareGP(model, model_test)
##D  }
##D }
##D ### Plot result
##D preds <- predict(x = Xgrid, model)
##D lines(Xgrid, preds$mean, col = 'red', lwd = 2)
##D lines(Xgrid, qnorm(0.05, preds$mean, sqrt(preds$sd2)), col = 2, lty = 2)
##D lines(Xgrid, qnorm(0.95, preds$mean, sqrt(preds$sd2)), col = 2, lty = 2)
##D lines(Xgrid, qnorm(0.05, preds$mean, sqrt(preds$sd2 + preds$nugs)), col = 3, lty = 2)
##D lines(Xgrid, qnorm(0.95, preds$mean, sqrt(preds$sd2 + preds$nugs)), col = 3, lty = 2)
##D par(new = TRUE)
##D plot(NA,NA, xlim = c(0, 1), ylim = c(0,max(model$mult)), axes = FALSE, ylab = "", xlab = "")
##D segments(x0 = model$X, x1 = model$X, y0 = rep(0, nrow(model$X)), y1 = model$mult, col = 'grey')
##D axis(side = 4)
##D mtext(side = 4, line = 2, expression(a[i]), cex = 0.8)
##D mtext(side = 2, line = 2, expression(f(x)), cex = 0.8)
##D mtext(side = 1, line = 2, 'x', cex = 0.8)
## End(Not run)



