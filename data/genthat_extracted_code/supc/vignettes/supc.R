## ----setup, include = FALSE----------------------------------------------
library(knitr)
library(rmarkdown)
show.obj <- function(obj) {
  paste(trimws(deparse(obj)), collapse = " ")
}
.quote <- "`"
quoted.string <- function(str) {
  sprintf("%s%s%s", .quote, str, .quote)
}
opts_chunk$set(fig.width = 8, fig.height = 5)

## ----computation-time, eval = FALSE, echo = FALSE------------------------
#  get.x <- function(m, n) {
#    matrix(rnorm(m * n), m, n)
#  }
#  dist.time <- lapply(list(stats::dist, function(x) amap::Dist(x, nbproc = 8), gputools::gpuDist), function(.dist) {
#    outer(floor(10^seq(2, 3, by = 0.5)), floor(10^seq(1, 3, by = 0.5)), Vectorize(function(a, b) {
#      set.seed(1)
#      X <- get.x(a, b)
#      cat(sprintf("%d,%d\n", a, b))
#      mean(sapply(1:10, function(i) system.time(.dist(X))[3]))
#    }))
#  })

## ----computation-time-result, echo = FALSE, warning = FALSE, error = FALSE----
dist.time <- list(structure(c(0, 0.000999999999839929, 0.00959999999986394, 
0.000399999999899592, 0.00270000000000437, 0.0268000000000939, 
0.00100000000002183, 0.00889999999999418, 0.106199999999899, 
0.00300000000006548, 0.0375999999999294, 0.795100000000002, 0.0112999999999374, 
0.191300000000047, 4.82540000000017), .Dim = c(3L, 5L)), structure(c(0.00180000000000291, 
0.00480000000015934, 0.022899999999936, 0.0024000000000342, 0.00780000000004293, 
0.0545000000000073, 0.00329999999985375, 0.02270000000035, 0.152599999999711, 
0.00759999999991123, 0.0563999999998487, 0.547500000000036, 0.0213999999999942, 
0.202700000000277, 2.1983000000002), .Dim = c(3L, 5L)), structure(c(0.00160000000005311, 
0.00650000000014188, 0.0901999999999134, 0.00140000000019427, 
0.00670000000009168, 0.0805000000000291, 0.00200000000004366, 
0.00779999999986103, 0.0997000000001208, 0.00200000000004366, 
0.0124000000001615, 0.140099999999984, 0.00420000000003711, 0.0291999999998552, 
0.332999999999993), .Dim = c(3L, 5L)))


local({
  dist.time <- lapply(dist.time, `+`, 1e-5)
  .x <- seq(1, 3, by = 0.5)
  .ymap <- function(y) log(y, 10)
  .y.max <- max(.ymap(unlist(dist.time)))
  .y.min <- min(.ymap(unlist(dist.time)))
  .y <- seq(floor(.y.min / 0.5) * 0.5, ceiling(.y.max / 0.5) * 0.5, by = 0.5)
  # animation::saveGIF(lapply(1:3, function(j) {
  if (interactive()) dev.off()
  layout(matrix(c(
    1,2,3,4,
    5,5,5,5
  ), byrow = TRUE, ncol = 4), heights = c(0.9, 0.1), widths = c(0.1, 0.3, 0.3, 0.3))
  par(mar = c(5.1, 4.1, 4.1, 0))
  plot(1, type = "n", axes=FALSE, xlab="", ylab="computation time (seconds)", ylim = c(.y.min, .y.max))
  axis(2, .y[seq_along(.y) %% 2 == 1], labels = do.call(what = expression, lapply(.y, function(.) substitute(10^y, list(y = .))))[seq_along(.y) %% 2 == 1])
  lapply(1:3, function(j) {
    par(mar = c(5.1, 0.1, 4.1, 0.1))
    plot(.x, rep(1, length(.x)), type = 'n', ylim = c(.y.min, .y.max), xlab = "number of variables", 
         #ylab = "computation time (seconds)", 
         xaxt = 'n', yaxt = 'n', bty = 'n')
    axis(1, .x, labels = expression(10^1, 10^1.5, 10^2, 10^2.5, 10^3))
    # axis(2, .y[seq_along(.y) %% 2 == 1], labels = do.call(what = expression, lapply(.y, function(.) substitute(10^y, list(y = .))))[seq_along(.y) %% 2 == 1])
    lapply(1:3, function(i) {
      lines(.x, .ymap(dist.time[[i]][j,]), lty = i)
      points(.x, .ymap(dist.time[[i]][j,]), pch = i)
    })
    # title(main = "Comparing speed of computing distance")
    mtext(sprintf("#samples:\n%d", floor(10^seq(2, 3, by = 0.5)[j])), side = 3)
  }) #, movie.name = "dist.gif", interval = 3)
  par(mar = rep(0, 4))
  plot(1, type = "n", axes=FALSE, xlab="", ylab="")
  legend("top", c("stats::dist", "amap::Dist", "gputools::gpuDist"), lty = 1:3, pch = 1:3, inset = 0, box.lty = 0)
})

## ------------------------------------------------------------------------
set.seed(1)
mu <- list(
  x = c(0, 2, 1, 6, 8, 7, 3, 5, 4),
  y = c(0, 0, 1, 0, 0, 1, 3, 3, 4)
)
X <- lapply(1:5, function(i) {
  cbind(rnorm(9, mu$x, 1/5), rnorm(9, mu$y, 1/5))
})
X <- do.call(rbind, X)

## ------------------------------------------------------------------------
n <- nrow(X)
X <- rbind(X, matrix(0, 20, 2))
k <- 1
while(k <= 20) {
  tmp <- c(13*runif(1)-2.5, 8*runif(1)-2.5)
  y1 <- mu$x - tmp[1]
  y2 <- mu$y - tmp[2]
  y <- sqrt(y1^2+y2^2)
  if (min(y)> 2){
    X[k+n,] <- tmp
    k <- k+1
  }
}

## ------------------------------------------------------------------------
plot(X, col="#999999")
points(X[1:n,])

## ------------------------------------------------------------------------
library(supc)
freq.poly(X, breaks = 50)

## ------------------------------------------------------------------------
X.freq <- freq.poly(X, breaks = 50)
abline(v = c(0.9, 1.7, 2.1, 2.5), lty = 2)

## ------------------------------------------------------------------------
library(supc)
X.supc <- supc1(X, r = 1.7, t = "static")

## ------------------------------------------------------------------------
str(X.supc)

## ------------------------------------------------------------------------
X.supc$cluster

## ------------------------------------------------------------------------
X.supc$centers

## ------------------------------------------------------------------------
X.supc$size

## ------------------------------------------------------------------------
X.supcs <- supc1(X, r = c(0.9, 1.7, 2.5), t = "dynamic")

## ------------------------------------------------------------------------
X.supcs$cluster

## ---- echo = FALSE-------------------------------------------------------
layout(matrix(1:4, 2, 2, byrow = TRUE))
par(mar = rep(2.1, 4))
plot(X, col="#999999", main = "Sample Data", xaxt = "n", yaxt = "n")
points(X[1:n,])
for(i in 1:3) {
  ids <- paste(X.supcs[[i]]$cluster)
  plot(X, type = "n", main = sprintf("r = %0.1f", X.supcs[[i]]$r), xaxt = "n", yaxt = "n")
  text(X, labels = ids, col = "#999999")
  text(X[1:n,], labels = ids[1:n])
  target.ids <- sort(unique(head(ids, n)))
  for(id in target.ids) {
    X.target <- X[ids == id,]
    center <- apply(X.target, 2, mean)
    r <- max(apply(X.target, 1, function(x) sqrt(sum((x - center)^2))))
    if (r < 0.5) r <- r + 0.2
    theta <- seq(0, 2 * pi, length.out = 1000)
    polygon(cbind(center[1] + r * cos(theta), center[2] + r * sin(theta)), lwd = 2, border = "blue")
  }
}

## ------------------------------------------------------------------------
plot(X.supcs[[1]], type = "heatmap", major.size = 2)

## ------------------------------------------------------------------------
plot(X.supcs[[2]], type = "heatmap", col = cm.colors(24), major.size = 5)

