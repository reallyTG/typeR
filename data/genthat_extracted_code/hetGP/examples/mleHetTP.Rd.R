library(hetGP)


### Name: mleHetTP
### Title: Student-t process modeling with heteroskedastic noise
### Aliases: mleHetTP

### ** Examples

##------------------------------------------------------------
## Example 1: Heteroskedastic TP modeling on the motorcycle data
##------------------------------------------------------------
set.seed(32)

## motorcycle data
library(MASS)
X <- matrix(mcycle$times, ncol = 1)
Z <- mcycle$accel
nvar <- 1
plot(X, Z, ylim = c(-160, 90), ylab = 'acceleration', xlab = "time")


## Model fitting
model <- mleHetTP(X = X, Z = Z, lower = rep(0.1, nvar), upper = rep(50, nvar),
                  covtype = "Matern5_2")
            
## Display averaged observations
points(model$X0, model$Z0, pch = 20)

## A quick view of the fit                  
summary(model)

## Create a prediction grid and obtain predictions
xgrid <- matrix(seq(0, 60, length.out = 301), ncol = 1) 
preds <- predict(x = xgrid, object =  model)

## Display mean predictive surface
lines(xgrid, preds$mean, col = 'red', lwd = 2)
## Display 95% confidence intervals
lines(xgrid, preds$mean + sqrt(preds$sd2) * qt(0.05, df = model$nu + nrow(X)), col = 2, lty = 2)
lines(xgrid, preds$mean + sqrt(preds$sd2) * qt(0.95, df = model$nu + nrow(X)), col = 2, lty = 2)
## Display 95% prediction intervals
lines(xgrid, preds$mean + sqrt(preds$sd2 + preds$nugs) * qt(0.05, df = model$nu + nrow(X)),
  col = 3, lty = 2)
lines(xgrid, preds$mean + sqrt(preds$sd2 + preds$nugs) * qt(0.95, df = model$nu + nrow(X)), 
  col = 3, lty = 2)

##------------------------------------------------------------
## Example 2: 2D Heteroskedastic TP modeling
##------------------------------------------------------------
set.seed(1)
nvar <- 2
  
## Branin redefined in [0,1]^2
branin <- function(x){
  if(is.null(nrow(x)))
    x <- matrix(x, nrow = 1)
    x1 <- x[,1] * 15 - 5
    x2 <- x[,2] * 15
    (x2 - 5/(4 * pi^2) * (x1^2) + 5/pi * x1 - 6)^2 + 10 * (1 - 1/(8 * pi)) * cos(x1) + 10
}

## Noise field via standard deviation
noiseFun <- function(x){
  if(is.null(nrow(x)))
    x <- matrix(x, nrow = 1)
  return(1/5*(3*(2 + 2*sin(x[,1]*pi)*cos(x[,2]*3*pi) + 5*rowSums(x^2))))
}

## data generating function combining mean and noise fields
ftest <- function(x){
  return(branin(x) + rnorm(nrow(x), mean = 0, sd = noiseFun(x)))
}

## Grid of predictive locations
ngrid <- 51
xgrid <- matrix(seq(0, 1, length.out = ngrid), ncol = 1) 
Xgrid <- as.matrix(expand.grid(xgrid, xgrid))

## Unique (randomly chosen) design locations
n <- 100
Xu <- matrix(runif(n * 2), n)

## Select replication sites randomly
X <- Xu[sample(1:n, 20*n, replace = TRUE),]

## obtain training data response at design locations X
Z <- ftest(X)

## Formating of data for model creation (find replicated observations) 
prdata <- find_reps(X, Z, rescale = FALSE, normalize = FALSE)

## Model fitting
model <- mleHetTP(X = list(X0 = prdata$X0, Z0 = prdata$Z0, mult = prdata$mult), Z = prdata$Z, ,
                  lower = rep(0.01, nvar), upper = rep(10, nvar),
                  covtype = "Matern5_2")

## a quick view into the data stored in the "hetTP"-class object
summary(model)                  
             
## prediction from the fit on the grid     
preds <- predict(x = Xgrid, object =  model)

## Visualization of the predictive surface
par(mfrow = c(2, 2))
contour(x = xgrid,  y = xgrid, z = matrix(branin(Xgrid), ngrid), 
  main = "Branin function", nlevels = 20)
points(X, col = 'blue', pch = 20)
contour(x = xgrid,  y = xgrid, z = matrix(preds$mean, ngrid), 
  main = "Predicted mean", nlevels = 20)
points(X, col = 'blue', pch = 20)
contour(x = xgrid,  y = xgrid, z = matrix(noiseFun(Xgrid), ngrid), 
  main = "Noise standard deviation function", nlevels = 20)
points(X, col = 'blue', pch = 20)
contour(x = xgrid,  y= xgrid, z = matrix(sqrt(preds$nugs), ngrid), 
  main = "Predicted noise values", nlevels = 20)
points(X, col = 'blue', pch = 20)
par(mfrow = c(1, 1))



