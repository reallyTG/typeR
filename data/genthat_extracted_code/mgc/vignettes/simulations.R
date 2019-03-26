## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(fig.width=4, fig.height=3)

## ---- message=FALSE------------------------------------------------------
require(mgc)
require(ggplot2)
n=400
d=1

## ------------------------------------------------------------------------
plot_sim <- function(X, Y, name) {
  if (!is.null(dim(Y))) {
    Y <- Y[, 1]
  }
  data <- data.frame(x1=X[,1], y=Y)
  ggplot(data, aes(x=x1, y=y)) +
    geom_point() +
    xlab("x") +
    ylab("y") +
    ggtitle(name) +
    theme_bw()
}

plot_sim_func <- function(X, Y, Xf, Yf, name, geom='line') {
  if (!is.null(dim(Y))) {
    Y <- Y[, 1]
    Yf <- Yf[, 1]
  }
  if (geom == 'points') {
    funcgeom <- geom_point
  } else {
    funcgeom <- geom_line
  }
  data <- data.frame(x1=X[,1], y=Y)
  data_func <- data.frame(x1=Xf[,1], y=Yf)
  ggplot(data, aes(x=x1, y=y)) +
    funcgeom(data=data_func, aes(x=x1, y=y), color='red', size=3) +
    geom_point() +
    xlab("x") +
    ylab("y") +
    ggtitle(name) +
    theme_bw()
}

## ------------------------------------------------------------------------
data <- mgc.sims.linear(n, d)
X <- data$X; Y <- data$Y
func <- mgc.sims.linear(n, d, eps=0)
Xf <- func$X; Yf <- func$Y
plot_sim_func(X, Y, Xf, Yf, "Linear Simulation")

## ------------------------------------------------------------------------
data <- mgc.sims.exp(n, d)
X <- data$X; Y <- data$Y
func <- mgc.sims.exp(n, d, eps=0)
Xf <- func$X; Yf <- func$Y
plot_sim_func(X, Y, Xf, Yf, "Exponential Simulation")

## ------------------------------------------------------------------------
data <- mgc.sims.cubic(n, d)
X <- data$X; Y <- data$Y
func <- mgc.sims.cubic(n, d, eps=0)
Xf <- func$X; Yf <- func$Y
plot_sim_func(X, Y, Xf, Yf, "Cubic Simulation")

## ------------------------------------------------------------------------
data <- mgc.sims.joint(n, d)
X <- data$X; Y <- data$Y
plot_sim(X, Y, "Joint-Normal Simulation")

## ------------------------------------------------------------------------
data <- mgc.sims.step(n, d)
X <- data$X; Y <- data$Y
func <- mgc.sims.step(n, d, eps=0)
Xf <- func$X; Yf <- func$Y
plot_sim_func(X, Y, Xf, Yf, "Step-Fn Simulation")

## ------------------------------------------------------------------------
data <- mgc.sims.quad(n, d)
X <- data$X; Y <- data$Y
func <- mgc.sims.quad(n, d, eps=0)
Xf <- func$X; Yf <- func$Y
plot_sim_func(X, Y, Xf, Yf, "Quadratic Simulation")

## ------------------------------------------------------------------------
data <- mgc.sims.wshape(n, d)
X <- data$X; Y <- data$Y
func <- mgc.sims.wshape(n, d, eps=0)
Xf <- func$X; Yf <- func$Y
plot_sim_func(X, Y, Xf, Yf, "W Simulation")

## ------------------------------------------------------------------------
data <- mgc.sims.spiral(n, d)
X <- data$X; Y <- data$Y
func <- mgc.sims.spiral(n=1000, d, eps=0)
Xf <- func$X; Yf <- func$Y
plot_sim_func(X, Y, Xf, Yf, "Spiral Simulation", geom='points')

## ------------------------------------------------------------------------
data <- mgc.sims.ubern(n, d)
X <- data$X; Y <- data$Y
plot_sim(X, Y, "Uncorrelated Bernoulli Simulation")

