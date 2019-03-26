library(hetGP)


### Name: allocate_mult
### Title: Allocation of replicates on existing designs
### Aliases: allocate_mult

### ** Examples

##------------------------------------------------------------
## Example: Heteroskedastic GP modeling on the motorcycle data
##------------------------------------------------------------
set.seed(32)

## motorcycle data
library(MASS)
X <- matrix(mcycle$times, ncol = 1)
Z <- mcycle$accel
nvar <- 1

data_m <- find_reps(X, Z, rescale = TRUE)

plot(rep(data_m$X0, data_m$mult), data_m$Z, ylim = c(-160, 90),
     ylab = 'acceleration', xlab = "time")


## Model fitting
model <- mleHetGP(X = list(X0 = data_m$X0, Z0 = data_m$Z0, mult = data_m$mult),
                  Z = Z, lower = rep(0.1, nvar), upper = rep(5, nvar),
                  covtype = "Matern5_2")
## Compute best allocation                  
A <- allocate_mult(model, N = 1000)

## Create a prediction grid and obtain predictions
xgrid <- matrix(seq(0, 1, length.out = 301), ncol = 1) 
predictions <- predict(x = xgrid, object =  model)

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

par(new = TRUE)
plot(NA,NA, xlim = c(0,1), ylim = c(0,max(A)), axes = FALSE, ylab = "", xlab = "")
segments(x0 = model$X0, x1 = model$X0, 
y0 = rep(0, nrow(model$X)), y1 = A, col = 'grey')
axis(side = 4)
mtext(side = 4, line = 2, expression(a[i]), cex = 0.8)       



