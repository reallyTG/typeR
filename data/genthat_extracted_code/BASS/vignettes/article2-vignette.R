## ----setup, include=FALSE, cache=FALSE-------------------------------------
library(knitr)
# set global chunk options
opts_chunk$set(prompt=TRUE)
options(replace.assign=TRUE, width=77, prompt="R> ")
opts_chunk$set(fig.width=6, fig.height=6, fig.align='center', out.width='.4\\linewidth')#, tidy=T, tidy.opts=list(width.cutoff=60))
knitr::render_sweave() 

## --------------------------------------------------------------------------
library("BASS")

## ----c1-1,cache=T----------------------------------------------------------
set.seed(0)
f <- function(x) {
  -.1 * x^3 + 2 * as.numeric((x < 4) * (x > 0)) * sin(pi * x^2) * (x - 4)^2
}
sigma <- 1
n <- 1000
x <- runif(n, -5, 5)
y <- rnorm(n, f(x), sigma)

## ----c1-2,cache=T,dependson='c1-1'-----------------------------------------
mod<-bass(x, y)

## ----ex1plot1, fig.height=12*.5, fig.width=15*.5, out.width='.75\\linewidth', fig.cap='Diagnostic plots for BASS model fitting.'----
plot(mod)

## ----c1-3,cache=T,dependson=c('c1-1','c1-2')-------------------------------
n.test <- 1000
x.test <- sort(runif(n.test, -5, 5))
pred <- predict(mod, x.test, verbose = T)

## ----ex1plot2, fig.cap='BASS prediction on test data.',fig.width=6*.7,fig.height=6*.7----
fx.test <- f(x.test)
plot(fx.test, colMeans(pred))
abline(a = 0, b = 1, col = 2)

## ----ex1plot3, fig.height=6*.8, fig.width=10*.8, out.width='.8\\linewidth', fig.cap='True curve with posterior predictive draws.',dev='pdf'----
plot(x, y, cex = .5)
curve(f(x), add = T, lwd = 3, n = 1000, col = 2, lty = 2)
matplot(x.test, t(pred[seq(100, 1000, 100), ]), type='l', add=T, col=3)
rug(BASS:::unscale.range(mod$curr.list[[1]]$knots.des, range(x)))
legend('topright', legend = c('true curve', 'posterior predictive draws'), 
       col = c(2:3), lty = c(2, 1), lwd = c(3, 1), bty = 'n')

## ----c1-4, cache=T, dependson='c1-1', results='hide'-----------------------
mod <- bass(x, y, h2 = 100)

## ----ex1plot4, fig.height=6*.8, fig.width=10*.8, out.width='.8\\linewidth', fig.cap='True curve with posterior predictive draws and more restrictive prior on the number of basis functions.'----
pred <- predict(mod, x.test)
plot(x, y, cex = .5)
curve(f(x), add = T, lwd = 3, n = 1000, col = 2, lty = 2)
matplot(x.test, t(pred[seq(100, 1000, 100), ]), type='l', add=T, col=3)
rug(BASS:::unscale.range(mod$curr.list[[1]]$knots.des, range(x)))
legend('topright', legend = c('true curve', 'posterior predictive draws'), 
       col = c(2:3), lty = c(2, 1), lwd = c(3, 1), bty = 'n')

## ----c2-1, cache=T---------------------------------------------------------
set.seed(0)
f <- function(x) {
  10 * sin(pi * x[, 1] * x[, 2]) + 20 * (x[, 3] - .5)^2 + 
    10 * x[, 4] + 5 * x[, 5]
}
sigma <- 1
n.vars <- 10
n <- 200
x <- matrix(runif(n * n.vars), n, n.vars)
y <- rnorm(n, f(x), sigma)

## ----c2-2, cache=T, dependson='c2-1'---------------------------------------
mod <- bass(x, y, nmcmc = 40000, nburn = 30000, thin = 10, 
            temp.ladder = (1 + .27)^(1:9 - 1), verbose = F)

## ----c2-3, cache=T, dependson=c('c2-1','c2-2')-----------------------------
n.test <- 1000
x.test <- matrix(runif(n.test * n.vars), n.test)
pred <- predict(mod, x.test, verbose = T)

## ----ex2plot1, fig.cap='BASS prediction on test data - Friedman function.',fig.width=6*.7,fig.height=6*.7----
fx.test <- f(x.test)
plot(fx.test, colMeans(pred))
abline(a = 0, b = 1, col = 2)

## ----c2-4, cache=T, dependson='c2-2', results='hide'-----------------------
sens <- sobol(mod, verbose = F)

## ----ex2plot2, fig.height=6, fig.width=12, out.width='.8\\linewidth', fig.cap='BASS sensitivity analysis - Friedman function.'----
plot(sens, cex.axis = .5)

## ----ex2plot3, fig.cap='Most important main effects and interactions - Friedman function.'----
boxplot(sens$S[, colMeans(sens$S) > .01], las = 2, 
        ylab = 'proportion variance', range = 0)

## ----tidy=T----------------------------------------------------------------
mod$count.swap / mod$count.swap.prop

## ----ex2plot4, fig.height=5, fig.width=12, out.width='\\linewidth', fig.cap='Parallel tempering diagnostics - swap trace plot.',dev='png'----
matplot(mod$temp.val, type = 'l', ylab = 'temperature index')

## ----ex2plot5, out.width='.7\\linewidth', fig.cap='Predicted versus observed for the last MCMC iteration of the nine chains at different temperatures.  The temperatures are shown above each plot.'----
par(mfrow=c(3,3))
temp.ind <- sapply(mod$curr.list, function(x) x$temp.ind)
for(i in 1:length(mod$temp.ladder)) {
  ind <- which(temp.ind == i)
  yhat <- mod$curr.list[[ind]]$des.basis %*% mod$curr.list[[ind]]$beta
  plot(yhat, y, main = round(mod$temp.ladder[i], 2))
  abline(a = 0, b = 1, col = 2)
}

## ----c2-5, cache=T, dependson='c2-1'---------------------------------------
mod.noTemp <- bass(x, y, nmcmc = 40000, nburn = 30000, 
                   thin = 10, verbose = F)

## ----c2-6, cache=T, dependson=c('c2-3','c2-5')-----------------------------
pred.noTemp <- predict(mod.noTemp, x.test)
sqrt(mean((colMeans(pred.noTemp) - fx.test)^2))

## --------------------------------------------------------------------------
quants.noTemp <- apply(pred.noTemp, 2, quantile, probs = c(.025, .975))
mean((quants.noTemp[1, ] < fx.test) & (quants.noTemp[2, ] > fx.test))

## --------------------------------------------------------------------------
sqrt(mean((colMeans(pred) - fx.test)^2))

## --------------------------------------------------------------------------
quants <- apply(pred, 2, quantile, probs = c(.025, .975))
mean((quants[1, ] < fx.test) & (quants[2, ] > fx.test))

## ----c3-1, cache=T---------------------------------------------------------
set.seed(0)
f <- function(x) {
  as.numeric(x[, 11] == 1) * (10 * sin(pi * x[, 1] * x[, 2])) +
  as.numeric(x[ ,11] == 2) * (20 * (x[, 3] - .5)^2) +
  as.numeric(x[, 11] == 3) * (10 * x[, 4] + 5 * x[, 5]) +
  as.numeric(x[, 11] == 4) * (10 * sin(pi * x[, 5] * x[, 4]) + 
                    20 * (x[, 3] - .5)^2 + 10 * x[, 2] + 5 * x[, 1])
}
sigma <- 1
n <- 500
x <- data.frame(matrix(runif(n * 10), n, 10), 
                as.factor(sample(1:4, size = n, replace = T)))
y <- rnorm(n, f(x), sigma)

## ----c3-2, cache=T, dependson='c3-1'---------------------------------------
mod <- bass(x, y, nmcmc = 40000, nburn = 30000, thin = 10,
            temp.ladder = (1 + .2)^(1:6 - 1), verbose = F)
n.test <- 1000
x.test <- data.frame(matrix(runif(n.test * 10), n.test, 10), 
                     as.factor(sample(1:4, size = n.test, replace = T)))
pred <- predict(mod, x.test)

## ----ex3plot1, fig.cap='BASS prediction on test data - Friedman function with categorical predictor.',fig.width=6*.7,fig.height=6*.7----
fx.test <- f(x.test)
plot(fx.test, colMeans(pred))
abline(a = 0, b = 1, col = 2)

## ----c3-3, cache=T, dependson='c3-2', results='hide'-----------------------
sens <- sobol(mod)

## ----ex3plot2, fig.cap='Most important main effects and interactions - Friedman function with categorical predictor.',fig.width=6*.7,fig.height=6*.7----
boxplot(sens$S[, colMeans(sens$S) > .005], las = 2, 
        ylab = 'proportion variance', range = 0)

## ----c4-1, cache=T---------------------------------------------------------
set.seed(0)
f<-function(x) {
  10 * sin(2 * pi * x[, 1] * x[, 2]) + 20 * (x[, 3] - .5)^2 + 
    10 * x[, 4] + 5 * x[, 5]
}
sigma <- 1
n <- 500
n.func <- 50
x.func <- seq(0, 1, length.out = n.func)
x <- matrix(runif(n * 9), n)
y <- matrix(f(cbind(rep(x.func, each = n), 
                    kronecker(rep(1, n.func), x))), 
            ncol = n.func) + rnorm(n * n.func, 0, sigma)

## ----ex4plot1, fig.height=6*.7, fig.width=8*.7, out.width='.5\\linewidth', fig.cap='500 Functional responses.  The goal is to fit a functional nonparametric regression model and perform sensitivity analysis.'----
matplot(x.func, t(y), type='l')

## ----c4-2, cache=T, dependson='c4-1'---------------------------------------
mod <- bass(x, y, xx.func = x.func)

## ----c4-3, cache=T, dependson='c4-2'---------------------------------------
n.test <- 100
x.test <- matrix(runif(n.test * 9), n.test)
pred <- predict(mod, x.test)

## ----ex4plot2, fig.cap='BASS prediction performance - Friedman function with functional response.', fig.height=6*.7, fig.width=6*.7----
fx.test<-matrix(f(cbind(rep(x.func, each = n.test), 
                        kronecker(rep(1, n.func), x.test))), ncol=n.func)
matplot(fx.test, apply(pred, 2:3, mean), type = 'l')
abline(a = 0, b = 1, col = 2)

## ----c4-4, cache=T, dependson='c4-2'---------------------------------------
sens <- sobol(mod, mcmc.use = 1:100)

## ----ex4plot3, fig.height=6*.7, fig.width=12*.7, out.width='.8\\linewidth', fig.cap='Sensitivity analysis - Friedman function with functional response.'----
plot(sens, cex.axis = .5)

## ----c4-5, cache=T, dependson='c4-2'---------------------------------------
sens.func <- sobol(mod, mcmc.use = 1:100, func.var = 1)

## ----ex4plot4, fig.height=6*.7, fig.width=12*.7, out.width='.8\\linewidth', fig.cap='Functional sensitivity analysis - Friedman function with functional response.'----
plot(sens.func)

## ----eval=F----------------------------------------------------------------
#  dd <- read.table('https://archive.ics.uci.edu/ml/
#    machine-learning-databases/00291/airfoil_self_noise.dat')

## ----include=F-------------------------------------------------------------
dd <- read.table('https://archive.ics.uci.edu/ml/machine-learning-databases/00291/airfoil_self_noise.dat')

## ----c5-1, cache=T---------------------------------------------------------
set.seed(0)
test <- sample(nrow(dd), size=150)
x <- dd[-test, 1:5]
y <- dd[-test, 6]

## ----c5-2, cache=T, dependson='c5-1'---------------------------------------
mod <- bass(x, y, nmcmc = 20000, nburn = 10000, thin = 10, 
            temp.ladder = 1.1^(0:5), verbose = F)

## ----c5-3, cache=T, dependson='c5-2'---------------------------------------
x.test <- dd[test, 1:5]
y.test <- dd[test, 6]
pred <- predict(mod, x.test)

## --------------------------------------------------------------------------
mult <- 1.96 * sqrt(mod$s2)
q1 <- apply(pred - mult, 2, quantile, probs = .025)
q2 <- apply(pred + mult, 2, quantile, probs = .975)
mean((q1 < y.test) & (q2 > y.test))

## ----ex5plot1, fig.cap='Prediction performance - air foil data.',fig.height=6*.7, fig.width=6*.7----
plot(y.test, colMeans(pred))
abline(a = 0, b = 1, col = 2)
segments(y.test, q1, y.test, q2, col = 'lightgrey')

## ----ex5plot2, cache=T, fig.height=6*.7, fig.width=12*.7, out.width='.8\\linewidth', fig.cap='Sobol decomposition - air foil data.'----
sens <- sobol(mod, verbose = F)
plot(sens)

## ----include=FALSE---------------------------------------------------------
environ <- function(xx, s=c(0.5, 1, 1.5, 2, 2.5), t=seq(from=0.3, to=60, by=0.3))
{
  ##########################################################################
  #
  # ENVIRONMENTAL MODEL FUNCTION
  #
  # Authors: Sonja Surjanovic, Simon Fraser University
  #          Derek Bingham, Simon Fraser University
  # Questions/Comments: Please email Derek Bingham at dbingham@stat.sfu.ca.
  #
  # Copyright 2013. Derek Bingham, Simon Fraser University.
  #
  # THERE IS NO WARRANTY, EXPRESS OR IMPLIED. WE DO NOT ASSUME ANY LIABILITY
  # FOR THE USE OF THIS SOFTWARE.  If software is modified to produce
  # derivative works, such modified software should be clearly marked.
  # Additionally, this program is free software; you can redistribute it
  # and/or modify it under the terms of the GNU General Public License as
  # published by the Free Software Foundation; version 2.0 of the License.
  # Accordingly, this program is distributed in the hope that it will be
  # useful, but WITHOUT ANY WARRANTY; without even the implied warranty
  # of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  # General Public License for more details.
  #
  # For function details and reference information, see:
  # http://www.sfu.ca/~ssurjano/
  #
  ##########################################################################
  #
  # OUTPUT AND INPUTS:
  #
  # y = row vector of scaled concentrations of the pollutant at the
  #     space-time vectors (s, t)
  #     Its structure is:
  #     y(s_1, t_1), y(s_1, t_2), ..., y(s_1, t_dt), y(s_2, t_1), ...,
  #     y(s_2,t_dt), ..., y(s_ds, t_1), ..., y(s_ds, t_dt)
  # xx = c(M, D, L, tau)
  # s = vector of locations (optional), with default value
  #     c(0.5, 1, 1.5, 2, 2.5)
  # t = vector of times (optional), with default value
  #     c(0.3, 0.6, ..., 50.7, 60)
  #
  ##########################################################################
  
  M   <- xx[1]
  D   <- xx[2]
  L   <- xx[3]
  tau <- xx[4]
  
  ds <- length(s)
  dt <- length(t)
  dY <- ds * dt
  Y <- matrix(0, ds, dt)
  
  # Create matrix Y, where each row corresponds to si and each column
  # corresponds to tj.
  for (ii in 1:ds) {
    si <- s[ii]
    for (jj in 1:dt) {
      tj <- t[jj]
      
      term1a <- M / sqrt(4*pi*D*tj)
      term1b <- exp(-si^2 / (4*D*tj))
      term1 <- term1a * term1b
      
      term2 <- 0
      if (tau < tj) {
        term2a <- M / sqrt(4*pi*D*(tj-tau))
        term2b <- exp(-(si-L)^2 / (4*D*(tj-tau)))
        term2 <- term2a * term2b
      }
      
      C <- term1 + term2
      Y[ii, jj] <- sqrt(4*pi) * C
    }
  }
  
  # Convert the matrix into a vector (by rows).
  Yrow <- t(Y)
  y <- t(as.vector(Yrow))
  return(y)
}


# M ∈ [7, 13]	mass of pollutant spilled at each location
# D ∈ [0.02, 0.12]	diffusion rate in the channel
# L ∈ [0.01, 3]	location of the second spill
# τ ∈ [30.01, 30.295]   	time of the second spill

## ----c6-1, cache=T---------------------------------------------------------
set.seed(0)
n <- 10000
x <- cbind(runif(n, 7, 13), runif(n, .02, .12), runif(n, .01, 3),
           runif(n, 30.01, 30.295))

## ----c6-2, cache=T---------------------------------------------------------
s <- c(0, 0.5, 1, 1.5, 2, 2.5)
t <- seq(.3, 60, length.out = 20)
x.func <- expand.grid(t, s)

## ----c6-3, cache=T, dependson=c('c6-1','c6-2')-----------------------------
out <- t(apply(x, 1, environ, s = s, t = t))
y <- log(out + .01)

## ----c6-4, cache=T, dependson='c6-3'---------------------------------------
mod <- bass(x, y, xx.func = x.func, nmcmc = 110000, nburn = 100000, 
            thin = 10, h2 = 1e250, save.yhat = F, temp.ladder = rep(1, 10), 
            npart.func = 1, verbose = F, maxBasis = 175)

## ----c6-5, cache=T, dependson='c6-4'---------------------------------------
n.test <- 1000
x.test <- cbind(runif(n.test, 7, 13),runif(n.test, .02, .12),
              runif(n.test, .01, 3), runif(n.test, 30.01, 30.295))
y.test <- log(t(apply(x.test, 1, environ, s = s, t = t)) + .01)
pred <- predict(mod, x.test)

## ----ex6plot1, fig.cap='BASS prediction performance - pollutant spill model.',dev='png', fig.height=6*.7, fig.width=6*.7----
plot(y.test, apply(pred, 2:3, mean))
abline(a = 0, b = 1, col = 2)

## ----ex6plot2, fig.height=10*.7, fig.width=12*.7, out.width='\\linewidth', fig.cap='BASS prediction in space and time - pollutant spill model.'----
pp <- pred[, 1, ]
ylim <- range(y)
par(mfrow=c(2, 3))
for(i in 1:length(s)) {
  ind <- length(t) * (i - 1) + 1:length(t)
  matplot(t, t(pp[, ind]), type = 'l', col = 'lightgrey', 
          ylim = ylim, main = paste('s =', s[i]))
  lines(t, y.test[1, ind], col = 2, lwd = 2, lty = 2)
}

## ----ex6plot3, cache=T, fig.height=6*.7, fig.width=12*.7, out.width='.8\\linewidth', fig.cap='Sensitivity indices as a function of time - pollutant spill model.'----
sens.func1 <- sobol(mod, mcmc.use = 1,#seq(1, 1000, 100),
                    func.var = 1, xx.func.var = t, verbose = F)
plot(sens.func1)

