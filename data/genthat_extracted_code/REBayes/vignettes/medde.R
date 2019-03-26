## ----preliminaries, echo=FALSE, warning = FALSE, message = FALSE, results='hide'----
hasMosek <- requireNamespace("Rmosek", quietly = TRUE)                
if(hasMosek) 
    hasMosek <- tryCatch(example(mosek)$value$response$code == 0,
			   warning = function(c) 0,
			   error = function(c) 0)
if (!hasMosek) {                                                                     
                knitr::opts_chunk$set(eval = FALSE)                                   
                msg <- paste("This vignette requires Mosek, but this system",
                             "does not have Mosek",
                             "installed, so code examples will not be evaluated.")
                msg <- paste(strwrap(msg), collapse="\n")
                message(msg) 
            }
require("REBayes")
knitr::render_sweave()
options(prompt = "R> ", continue = "+  ", digits = 2, show.signif.stars = FALSE)
cleanup <- FALSE

## ----Guvsetup, include = FALSE-------------------------------------------
Guv.cap <- "Density estimation of annual increments in log income for U.S. individuals over
the period 1994-2013.  The left panel of the figure reproduces a plot of the logarithm
of a kernel density estimate from \\cite{Guvenen} showing that annual income increments
are clearly not log concave.  However the middle panel showing $-1/\\sqrt{f}$ does
appear to be nicely concave and is fit remarkably well by the \\Renyi  procedure with 
$\\alpha = 1/2$."

## ----Guv, fig.height = 4, fig.width = 10, fig.cap = Guv.cap, echo = FALSE----
# Estimate Hellinger Model for Guvenen Annual Income Increment Data
data(Guvenen)
x <- Guvenen[,1]
y <- Guvenen[,2] # Log(f(x))


par(mfrow = c(1,3))
par(mgp = c(2,1,0))
# Left Panel:  Log Concavity is violated
plot(x, y, xlab = "x ~ log income annual increments", ylab = "log f(x)", type = "l")

# But Hellinger Concavity is plausible
plot(x, -1/sqrt(exp(y)), xlab = "x ~ log income annual increments", 
     ylab = expression(-1/sqrt(f(x))), type = "l")
w <- exp(y)*diff(x)[1]
f <- medde(x, w = w, lambda = - 0.5, alpha = 0.5)
s <- (f$x > -3.7) & (f$x < 3.7)
xx <- f$x[s]
yy <- f$y[s]
zz <- -1/sqrt(yy)
lines(xx,zz,col = "red")
# Right Panel:  Density Estimates
plot(xx, yy,xlab = "x ~ log income annual increments", ylab = "f(x)", type = "l")
lines(x,exp(y),col = "red")

## ----velosetup, include = FALSE------------------------------------------
velo.cap <- "Rotational velocity of stars with three quasi concave shape constrained density estimates 
    using the \\Renyi likelihood."

## ----velo, fig.height = 5, fig.width = 7, fig.cap = velo.cap, echo = FALSE----
# Star velocity Hellinger plot in K&M Quasi paper Revisited

data(velo)
x <- velo
x <- x[!(x == 0)]  # drop zero velocities
hist(x, 100, freq = FALSE, main = "")
alphas <- c(0.5, 0, -2)
for(i in 1:3){
    f <- medde(x, v = 1000, lambda = -0.5, alpha = alphas[i], rtol = 1e-8)
    lines(f$x, f$y, col = i+1)
}
leg <- as.expression(lapply(c(1/2,0,-2),function(x) bquote(alpha ==.(x))))
legend(300, 0.025, leg, lty = 1, col = 2:4)

## ----Silsetup, include = FALSE-------------------------------------------
Sil.cap <- "Gaussian histogram based on 500 observations and two penalized
maximum likelihood estimates with total variation norm penalty
and $\\lambda \\in \\{ 0.5 \\times 10^{-4}, 0.5 \\times 10^{-6} \\}$."

## ----Silverman, fig.height = 5, warning = FALSE, fig.width = 7, fig.cap = Sil.cap, echo = FALSE----
# Silverman type total variation roughness penalty estimation in medde
# Silverman BW (1982). On the Estimation of a Probability Density Function
# by the Maximum Penalized Likelihood Method. Annals of Statistics, 10, 795-810
n <- 500
set.seed <-18 
x <- rnorm(n)
hist(x, 70, freq = FALSE, main = "", col = grey(.95))
f <- medde(x, Dorder = 2, lambda = 1, verb = 0)
lines(f, col = "red")
f <- medde(x, Dorder = 2, lambda = 0.05, verb = 0)
lines(f, col = "blue")

## ----lnormsetup, include = FALSE-----------------------------------------
lnorm.cap <- "Mixture of three lognormals histogram and two
\\Renyi likelihood estimates with total variation ($L_1$ norm) penalty
with $\\alpha \\in \\{ 0, 1 \\}$."

## ----lnormmix, fig.height = 5, fig.width = 7, fig.cap = lnorm.cap, echo = FALSE----
# Mixture of log normals example from ancient problem set
rlambda <- function(n, mu = c(0.5, 1.1, 2.6), sigma = c(0.2, 0.3, 0.2), 
	 alpha = c(0.4, 1.2, 2.4), w = c( 0.33, 0.33, 0.34))
{ #mixture of lognormals -- random numbers
  #No error checking!  w is a weight vector which should add to one.
  m <- length(w)
  w <- cumsum(w)
  U <- runif(n)
  W <- matrix(0, n, m)
  W[, 1] <- U < w[1]
  for(i in 2:m) {
      W[, i] <- (U < w[i]) & (U >= w[i - 1])
     }
  z <- rep(0, n)
  for(i in 1:m) {
      z <- z + W[, i] * (alpha[i] + exp(rnorm(n, mu[i], sigma[i])))
     }
  z
}
dlambda <- function(z, mu = c(0.5, 1.1, 2.6), sigma = c(0.2, 0.3, 0.2), 
	 alpha = c(0.4, 1.2, 2.4), w = c( 0.33, 0.33, 0.34), eps = 0.0001)
{
#mixture of lognormals density function
m <- length(w)
f <- 0 * z
for(i in 1:m) 
    f <- f + (w[i] * dnorm(log(pmax(z - alpha[i], eps)), mu[i], 
			 sigma[ i]))/((z - alpha[i]))
f
}
set.seed(17)
x <- rlambda(500)
hist(x, 200, freq = FALSE, border = "grey", main = "")
z <- seq(0,max(x), length=2000)
lines(z, dlambda(z), col = 2)
f <- medde(x, lambda = 0.5, Dorder = 2, alpha = 0)
lines(f, col = "blue")
f <- medde(x, lambda = 0.05, Dorder = 2, alpha = 1)
lines(f, col = "green")
leg <- c("True", as.expression(lapply(c(0,1),function(x) bquote(alpha ==.(x)))))
legend(15,0.4,leg, lty = 1, lwd = 1.5, col = c("red","blue","green"))

