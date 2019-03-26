library(rootSolve)


### Name: gradient
### Title: Estimates the gradient matrix for a simple function
### Aliases: gradient
### Keywords: math

### ** Examples

## =======================================================================
## 1. Sensitivity analysis of the logistic differential equation
## dN/dt = r*(1-N/K)*N  , N(t0)=N0.
## =======================================================================

# analytical solution of the logistic equation:
logistic <- function (x, times) {

 with (as.list(x),
 {
  N <- K / (1+(K-N0)/N0*exp(-r*times))
  return(c(N = N))
  })
}

# parameters for the US population from 1900
x <- c(N0 = 76.1, r = 0.02, K = 500)

# Sensitivity function: SF: dfi/dxj at
# output intervals from 1900 to 1950
SF <- gradient(f = logistic, x, times = 0:50)

# sensitivity, scaled for the value of the parameter:
# [dfi/(dxj/xj)]= SF*x (columnise multiplication)
sSF <- (t(t(SF)*x))
matplot(sSF, xlab = "time", ylab = "relative sensitivity ",
        main = "logistic equation", pch = 1:3)
legend("topleft", names(x), pch = 1:3, col = 1:3)

# mean scaled sensitivity
colMeans(sSF)

## =======================================================================
## 2. Stability of the budworm model, as a function of its
## rate of increase.
##
## Example from the book of Soetaert and Herman(2009)
## A practical guide to ecological modelling,
## using R as a simulation platform. Springer
## code and theory are explained in this book
## =======================================================================

r   <- 0.05
K   <- 10
bet <- 0.1
alf <- 1

# density-dependent growth and sigmoid-type mortality rate
rate <- function(x, r = 0.05) r*x*(1-x/K) - bet*x^2/(x^2+alf^2)

# Stability of a root ~ sign of eigenvalue of Jacobian 
stability <- function (r)  {
  Eq <- uniroot.all(rate, c(0, 10), r = r)
  eig  <- vector()
  for (i in 1:length(Eq)) 
      eig[i] <- sign (gradient(rate, Eq[i], r = r))
  return(list(Eq = Eq, Eigen = eig))
}

# bifurcation diagram
rseq <- seq(0.01, 0.07, by = 0.0001)

plot(0, xlim = range(rseq), ylim = c(0, 10), type = "n",
     xlab = "r", ylab = "B*", main = "Budworm model, bifurcation",
     sub = "Example from Soetaert and Herman, 2009")

for (r in rseq) {
  st <- stability(r) 
  points(rep(r, length(st$Eq)), st$Eq, pch = 22,
         col = c("darkblue", "black", "lightblue")[st$Eigen+2],
         bg = c("darkblue", "black", "lightblue")[st$Eigen+2]) 
}

legend("topleft", pch = 22, pt.cex = 2, c("stable", "unstable"),
        col = c("darkblue","lightblue"), 
        pt.bg = c("darkblue", "lightblue"))


