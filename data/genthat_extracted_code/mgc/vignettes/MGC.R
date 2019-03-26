## ---- message=FALSE------------------------------------------------------
library(mgc)
library(reshape2)
library(ggplot2)

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

plot_mtx <- function(Dx, main.title="Local Correlation Map", xlab.title="# X Neighbors", ylab.title="# Y Neighbors") {
  data <- melt(Dx)
  ggplot(data, aes(x=Var1, y=Var2, fill=value)) +
    geom_tile() +
    scale_fill_gradientn(name="l-corr",
                         colours=c("#f2f0f7", "#cbc9e2", "#9e9ac8", "#6a51a3"),
                         limits=c(min(Dx), max(Dx))) +
    xlab(xlab.title) +
    ylab(ylab.title) +
    theme_bw() +
    ggtitle(main.title)
}

## ------------------------------------------------------------------------
n=200 # 100 samples
d=1 # simple 1-d case

set.seed(12345)
data <- mgc.sims.linear(n, d)  # data with noise
func <- mgc.sims.linear(n, d, eps=0)  # source function

## ---- fig.width=5, fig.height=3------------------------------------------
plot_sim_func(data$X, data$Y, func$X, func$Y, name="Linear Simulation")

## ---- fig.width=5, fig.height=4------------------------------------------
set.seed(12345)
res <- mgc.test(data$X, data$Y, rep=20)  # 100 permutations test

plot_mtx(res$localCorr, main.title="Local Correlation Map")

print(res$optimalScale)
print(res$statMGC)

## ---- fig.width=5, fig.height=4------------------------------------------
set.seed(12345)
res <- mgc.test(iris[,1], iris[,3], rep=20)
plot_mtx(res$localCorr, main.title="Local Correlation Map",
         xlab.title="Sepal Length Neighbors", ylab.title="Petal Length Neighbors")

print(res$optimalScale)
print(res$statMGC)

