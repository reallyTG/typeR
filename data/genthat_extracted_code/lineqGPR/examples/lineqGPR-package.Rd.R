library(lineqGPR)


### Name: lineqGPR-package
### Title: Gaussian Processes with Linear Inequality Constraints
### Aliases: lineqGPR-package lineqGPR

### ** Examples

## ------------------------------------------------------------------
## Gaussian process regression modelling under boundedness constraint
## ------------------------------------------------------------------
library(lineqGPR)

#### generating the synthetic data ####
sigfun <- function(x) return(1/(1+exp(-7*(x-0.5))))
x <- seq(0, 1, 0.001)
y <- sigfun(x)
DoE <- splitDoE(x, y, DoE.idx = c(201, 501, 801))

#### GP with inactive boundedness constraints ####
# creating the "lineqGP" model
model <- create(class = "lineqGP", DoE$xdesign, DoE$ydesign,
                constrType = c("boundedness"))
model$localParam$m <- 100
model$bounds <- c(-10,10)
model <- augment(model)

# sampling from the model
sim.model <- simulate(model, nsim = 1e3, seed = 1, xtest = DoE$xtest)
plot(sim.model, xlab = "x", ylab = "y(x)", ylim = range(y),
     main = "Unconstrained GP model")
lines(x, y, lty = 2)
legend("topleft", c("ytrain","ytest","mean","confidence"),
       lty = c(NaN,2,1,NaN), pch = c(20,NaN,NaN,15),
       col = c("black","black","darkgreen","gray80"))

#### GP with active boundedness constraints ####
# creating the "lineqGP" model
model <- create(class = "lineqGP", DoE$xdesign, DoE$ydesign,
                constrType = c("boundedness"))
model$localParam$m <- 100
model$bounds <- c(0,1)
model <- augment(model)

# sampling from the model
sim.model <- simulate(model, nsim = 1e3, seed = 1, xtest = DoE$xtest)
plot(sim.model, bounds = model$bounds,
     xlab = "x", ylab = "y(x)", ylim = range(y),
     main = "Constrained GP model under boundedness conditions")
lines(x, y, lty = 2)
legend("topleft", c("ytrain","ytest","mean","confidence"),
       lty = c(NaN,2,1,NaN), pch = c(20,NaN,NaN,15),
       col = c("black","black","darkgreen","gray80"))


## ------------------------------------------------------------------
## Gaussian process regression modelling under multiple constraints
## ------------------------------------------------------------------
library(lineqGPR)

#### generating the synthetic data ####
sigfun <- function(x) return(1/(1+exp(-7*(x-0.5))))
x <- seq(0, 1, 0.001)
y <- sigfun(x)
DoE <- splitDoE(x, y, DoE.idx = c(201, 501, 801))

#### GP with boundedness and monotonicity constraints ####
# creating the "lineqGP" model
model <- create(class = "lineqGP", DoE$xdesign, DoE$ydesign,
                constrType = c("boundedness","monotonicity"))
model$localParam$m <- 50
model$bounds[1, ] <- c(0,1)
model <- augment(model)

# sampling from the model
sim.model <- simulate(model, nsim = 1e2, seed = 1, xtest = DoE$xtest)
plot(sim.model, bounds = model$bounds,
     xlab = "x", ylab = "y(x)", ylim = range(y),
     main = "Constrained GP model under boundedness & monotonicity conditions")
lines(x, y, lty = 2)
legend("topleft", c("ytrain","ytest","mean","confidence"),
       lty = c(NaN,2,1,NaN), pch = c(20,NaN,NaN,15),
       col = c("black","black","darkgreen","gray80"))


## ------------------------------------------------------------------
## Gaussian process regression modelling under linear constraints
## ------------------------------------------------------------------
library(lineqGPR)
library(Matrix)

#### generating the synthetic data ####
targetFun <- function(x){
  y <- rep(1, length(x))
  y[x <= 0.4] <- 2.5*x[x <= 0.4]
  return(y)
}
x <- seq(0, 1, by = 0.001)
y <- targetFun(x)
DoE <- splitDoE(x, y, DoE.idx = c(101, 301, 501, 701))

#### GP with predefined linear inequality constraints ####
# creating the "lineqGP" model
model <- create(class = "lineqGP", DoE$xdesign, DoE$ydesign,
                constrType = c("linear"))
m <- model$localParam$m <- 100

# building the predefined linear constraints
bounds1 <- c(0,Inf)
LambdaB1 <- diag(2*m/5)
LambdaM <- diag(2*m/5)
LambdaB2 <- diag(3*m/5)
lsys <- lineqGPSys(m = 2*m/5, constrType = "monotonicity",
                   l = bounds1[1], u = bounds1[2], lineqSysType = "oneside")
LambdaM[-seq(1),] <- lsys$M
model$Lambda <- as.matrix(bdiag(rbind(LambdaM,LambdaB1),LambdaB2))
model$lb <- c(-Inf, rep(0, 2*m/5-1), rep(0, 2*m/5), rep(0.85, 3*m/5))
model$ub <- c(rep(0.1, 2*m/5), rep(1.1, 2*m/5), rep(1.1, 3*m/5))
model <- augment(model)

# sampling from the model
sim.model <- simulate(model, nsim = 1e3, seed = 1, xtest = DoE$xtest)
plot(sim.model, bounds = c(0,1.1),
     xlab = "x", ylab = "y(x)", ylim = c(0,1.1),
     main = "Constrained GP model under linear conditions")
lines(x, y, lty = 2)
abline(v = 0.4, lty = 2)
lines(c(0.4, 1), rep(0.85, 2), lty = 2)
legend("bottomright", c("ytrain","ytest","mean","confidence"),
       lty = c(NaN,2,1,NaN), pch = c(20,NaN,NaN,15),
       col = c("black","black","darkgreen","gray80"))


## ------------------------------------------------------------------
## Note:
## 1. More examples are given as demos (run: demo(package="lineqGPR")).
## 2. See also the examples from inner functions of the package
## (run: help("simulate.lineqGP")).
## ------------------------------------------------------------------




