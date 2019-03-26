context("MMDS")
test_that("can do MMDS with eurodist", {

make_mmds_fg <- function(distmat) {
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

set.seed(42)
ed0 <- rnorm(attr(datasets::eurodist, 'Size') * 2)
res <- mize(par = ed0, fg = make_mmds_fg(datasets::eurodist), method = "L-BFGS",
            rel_tol = 1e-8, step0 = 1, step_next_init = "quad")

# coordinates are abritrary, but hopefully repeatable thanks to set.seed
coords <- c(1735, 2143, 624.2, -768.1, -406.7, 50.9, -493.4, -126.8,
            -467, -484, -483.5, 286.7, -1087, 657.1, 313.3, -17.1,
            735.2, -1952, -757.3, 560.4, -610.4, 150.8, 123, -1941,
            208.9, -178.1, 342.6, -1392, 509.3, -286.1, 441.6, 277.6,
            80.96, 578.1, -237.7, -172.2, 1008, 690.4, -1757, 890.6,
            181.8, 1026)
expect_equal(coords, res$par, tolerance = 1e-4)
expect_equal(res$f, 3.356e6, tolerance = 1e-3)
expect_equal(res$nf, 103)
expect_equal(res$ng, 103)
})
