library(hetGP)


### Name: update.hetGP
### Title: Update '"hetGP"'-class model fit with new observations
### Aliases: update.hetGP

### ** Examples

##------------------------------------------------------------
## Sequential update example
##------------------------------------------------------------
set.seed(42)

## Spatially varying noise function
noisefun <- function(x, coef = 1){
  return(coef * (0.05 + sqrt(abs(x)*20/(2*pi))/10))
}

## Initial data set
nvar <- 1
n <- 20
X <- matrix(seq(0, 2 * pi, length=n), ncol = 1)
mult <- sample(1:10, n, replace = TRUE)
X <- rep(X, mult)
Z <- sin(X) + rnorm(length(X), sd = noisefun(X))

## Initial fit
testpts <- matrix(seq(0, 2*pi, length = 10*n), ncol = 1)
model <- model_init <- mleHetGP(X = X, Z = Z, lower = rep(0.1, nvar), 
  upper = rep(50, nvar), maxit = 1000)

## Visualizing initial predictive surface
preds <- predict(x = testpts, model_init) 
plot(X, Z)
lines(testpts, preds$mean, col = "red")

## 10 fast update steps
nsteps <- 5
npersteps <- 10
for(i in 1:nsteps){
  newIds <- sort(sample(1:(10*n), npersteps))
  
  newX <- testpts[newIds, drop = FALSE] 
  newZ <- sin(newX) + rnorm(length(newX), sd = noisefun(newX))
  points(newX, newZ, col = "blue", pch = 20)
  model <- update(object = model, Xnew = newX, Znew = newZ)
  X <- c(X, newX)
  Z <- c(Z, newZ)
  plot(X, Z)
  print(model$nit_opt)
}

## Final predictions after 10 updates
p_fin <- predict(x=testpts, model) 

## Visualizing the result by augmenting earlier plot
lines(testpts, p_fin$mean, col = "blue")
lines(testpts, qnorm(0.05, p_fin$mean, sqrt(p_fin$sd2)), col = "blue", lty = 2)
lines(testpts, qnorm(0.95, p_fin$mean, sqrt(p_fin$sd2)), col = "blue", lty = 2)
lines(testpts, qnorm(0.05, p_fin$mean, sqrt(p_fin$sd2 + p_fin$nugs)), 
  col = "blue", lty = 3)
lines(testpts, qnorm(0.95, p_fin$mean, sqrt(p_fin$sd2 + p_fin$nugs)), 
  col = "blue", lty = 3)

## Now compare to what you would get if you did a full batch fit instead
model_direct <-  mleHetGP(X = X, Z = Z, maxit = 1000,
                          lower = rep(0.1, nvar), upper = rep(50, nvar),
                          init = list(theta = model_init$theta, k_theta_g = model_init$k_theta_g))
p_dir <- predict(x = testpts, model_direct)
print(model_direct$nit_opt)
lines(testpts, p_dir$mean, col = "green")
lines(testpts, qnorm(0.05, p_dir$mean, sqrt(p_dir$sd2)), col = "green", 
  lty = 2)
lines(testpts, qnorm(0.95, p_dir$mean, sqrt(p_dir$sd2)), col = "green", 
  lty = 2)
lines(testpts, qnorm(0.05, p_dir$mean, sqrt(p_dir$sd2 + p_dir$nugs)), 
  col = "green", lty = 3)
lines(testpts, qnorm(0.95, p_dir$mean, sqrt(p_dir$sd2 + p_dir$nugs)), 
  col = "green", lty = 3)
lines(testpts, sin(testpts), col = "red", lty = 2)

## Compare outputs
summary(model_init)
summary(model)
summary(model_direct)




