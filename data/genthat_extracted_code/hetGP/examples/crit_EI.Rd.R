library(hetGP)


### Name: crit_EI
### Title: Expected Improvement criterion
### Aliases: crit_EI

### ** Examples

## Optimization example
set.seed(42)


## Noise field via standard deviation
noiseFun <- function(x, coef = 1.1, scale = 1){
if(is.null(nrow(x)))
 x <- matrix(x, nrow = 1)
   return(scale*(coef + cos(x * 2 * pi)))
}

## Test function defined in [0,1]
ftest <- function(x){
if(is.null(nrow(x)))
x <- matrix(x, ncol = 1)
return(f1d(x) + rnorm(nrow(x), mean = 0, sd = noiseFun(x)))
}

n_init <- 10 # number of unique designs
N_init <- 100 # total number of points
X <- seq(0, 1, length.out = 10)
X <- matrix(X[sample(1:n_init, N_init, replace = TRUE)], ncol = 1)
Z <- ftest(X)

## Predictive grid
ngrid <- 51
xgrid <- seq(0,1, length.out = ngrid)
Xgrid <- matrix(xgrid, ncol = 1)

model <- mleHetGP(X = X, Z = Z, lower = 0.001, upper = 1)

EIgrid <- crit_EI(Xgrid, model)
preds <- predict(x = Xgrid, model)

par(mar = c(3,3,2,3)+0.1)
plot(xgrid, f1d(xgrid), type = 'l', lwd = 1, col = "blue", lty = 3,
xlab = '', ylab = '', ylim = c(-8,16))
points(X, Z)
lines(Xgrid, preds$mean, col = 'red', lwd = 2)
lines(Xgrid, qnorm(0.05, preds$mean, sqrt(preds$sd2)), col = 2, lty = 2)
lines(Xgrid, qnorm(0.95, preds$mean, sqrt(preds$sd2)), col = 2, lty = 2)
lines(Xgrid, qnorm(0.05, preds$mean, sqrt(preds$sd2 + preds$nugs)), col = 3, lty = 2)
lines(Xgrid, qnorm(0.95, preds$mean, sqrt(preds$sd2 + preds$nugs)), col = 3, lty = 2)
par(new = TRUE)
plot(NA, NA, xlim = c(0, 1), ylim = c(0,max(EIgrid)), axes = FALSE, ylab = "", xlab = "")
lines(xgrid, EIgrid, lwd = 2, col = 'cyan')
axis(side = 4)
mtext(side = 4, line = 2, expression(EI(x)), cex = 0.8)
mtext(side = 2, line = 2, expression(f(x)), cex = 0.8)



