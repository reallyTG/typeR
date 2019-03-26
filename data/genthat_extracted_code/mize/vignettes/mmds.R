## ----setup, include = FALSE, echo = FALSE, message = FALSE---------------
knitr::opts_chunk$set(echo = TRUE, collapse = TRUE, comment = "#>")
library(mize)

## ----cost function-------------------------------------------------------
# R and D are the input and output distance matrices, respectively
cost_fun <- function(R, D) {
  diff2 <- (R - D) ^ 2
  sum(diff2) * 0.5
}

## ----convert dist to matrix----------------------------------------------
eurodist_mat <- as.matrix(eurodist)

## ----MMDS gradient-------------------------------------------------------
# R is the input distance matrix
# D is the output distance matrix
# y is a n x d matrix of output coordinates
cost_grad <- function(R, D, y) {
  K <- (R - D) / (D + 1.e-10)

  G <- matrix(nrow = nrow(y), ncol = ncol(y))
  
  for (i in 1:nrow(y)) {
    dyij <- sweep(-y, 2, -y[i, ])
    G[i, ] <- apply(dyij * K[, i], 2, sum)
  }

  as.vector(t(G)) * -2
}

## ----mize function-------------------------------------------------------
mmds_fn <- function(par) {
  R <- as.matrix(eurodist)
  y <- matrix(par, ncol = 2, byrow = TRUE)
  D <- as.matrix(stats::dist(y))
  
  cost_fun(R, D)
}

## ----mize gradient-------------------------------------------------------
mmds_gr <- function(par) {
  R <- as.matrix(eurodist)
  y <- matrix(par, ncol = 2, byrow = TRUE)
  D <- as.matrix(stats::dist(y))

  cost_grad(R, D, y)
}

## ----optimization--------------------------------------------------------
set.seed(42)
ed0 <- rnorm(attr(eurodist, 'Size') * 2)

res_euro <- mize(ed0, list(fn = mmds_fn, gr = mmds_gr), 
                method = "L-BFGS", verbose = TRUE, 
                grad_tol = 1e-5, check_conv_every = 10)

## ----plot results, fig.width=5.5, fig.height=5.5-------------------------
plot_mmds <- function(coords, dist, ...) {
  if (class(coords) == "numeric") {
    coords <- matrix(coords, ncol = 2, byrow = TRUE)
  }
  graphics::plot(coords, type = 'n')
  graphics::text(coords[, 1], coords[, 2], labels = labels(dist), ...)
}
plot_mmds(res_euro$par, eurodist, cex = 0.5)

## ----rotated plot, fig.width=5.5, fig.height=5.5-------------------------
rot90 <- matrix(c(0, -1, 1, 0), ncol = 2)
rotated <- t(rot90 %*% t(matrix(res_euro$par, ncol = 2, byrow = TRUE)))
plot_mmds(rotated, eurodist, cex = 0.5)

## ----more efficient fg---------------------------------------------------
make_fg <- function(distmat) {
  R <- as.matrix(distmat)
  cost_fun <- function(R, D) {
    diff2 <- (R - D) ^ 2
    sum(diff2) * 0.5
  }
  cost_grad <- function(R, D, y) {
    K <- (R - D) / (D + 1.e-10)

    G <- matrix(nrow = nrow(y), ncol = ncol(y))

    for (i in 1:nrow(y)) {
      dyij <- sweep(-y, 2, -y[i, ])
      G[i, ] <- apply(dyij * K[, i], 2, sum)
    }

    as.vector(t(G)) * -2
  }
  list(
    fn = function(par) {
      y <- matrix(par, ncol = 2, byrow = TRUE)
      D <- as.matrix(stats::dist(y))
      cost_fun(R, D)
    },
    gr = function(par) {
      y <- matrix(par, ncol = 2, byrow = TRUE)
      D <- as.matrix(stats::dist(y))
      cost_grad(R, D, y)
    },
    fg = function(par) {
      y <- matrix(par, ncol = 2, byrow = TRUE)
      D <- as.matrix(stats::dist(y))
      list(
        fn = cost_fun(R, D),
        gr = cost_grad(R, D, y)
      )
    }
  )
}

## ----optimization with improved fg---------------------------------------
res_euro <- mize(ed0, make_fg(eurodist), 
                method = "L-BFGS", verbose = TRUE, 
                grad_tol = 1e-5, check_conv_every = 10)

