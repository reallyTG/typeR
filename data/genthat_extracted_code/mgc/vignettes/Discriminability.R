## ------------------------------------------------------------------------
library(mgc)
library(reshape2)
library(ggplot2)

plot_mtx <- function(Dx, main.title="Distance Matrix", xlab.title="Sample Sorted by Source", ylab.title="Sample Sorted by Source") {
  data <- melt(Dx)
  ggplot(data, aes(x=Var1, y=Var2, fill=value)) +
    geom_tile() +
    scale_fill_gradientn(name="dist(x, y)",
                         colours=c("#f2f0f7", "#cbc9e2", "#9e9ac8", "#6a51a3"),
                         limits=c(min(Dx), max(Dx))) +
    xlab(xlab.title) +
    ylab(ylab.title) +
    theme_bw() +
    ggtitle(main.title)
}

## ------------------------------------------------------------------------
nsrc <- 5
nobs <- 10
d <- 20
set.seed(12345)
src_id <- array(1:nsrc)
labs <- sample(rep(src_id, nobs))
dat <- t(sapply(labs, function(lab) rnorm(d, mean=lab, sd=1)))
discr.stat(dat, labs)  # expect high discriminability since measurements taken at a source have the same mean and sd of only 1

## ---- fig.width=5, fig.height=4------------------------------------------
Dx <- as.matrix(dist(dat[sort(labs, index=TRUE)$ix,]), method='euclidian')
plot_mtx(Dx)

## ------------------------------------------------------------------------
discr.stat(Dx, sort(labs))

## ---- fig.width=5, fig.height=4------------------------------------------
Dx <- as.matrix(dist(iris[sort(as.vector(iris$Species), index=TRUE)$ix,c(1,2,3,4)]))

plot_mtx(Dx)

## ------------------------------------------------------------------------
discr.stat(iris[,c(1,2,3,4)], as.vector(iris$Species))

