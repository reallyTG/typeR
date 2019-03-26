library(supc)
wrong.dist <- function(x) {
  x[] <- 0
  stats::dist(x)
}
X <- local({
  set.seed(1)
  mu <- list(
    x = c(0, 2, 1, 6, 8, 7, 3, 5, 4),
    y = c(0, 0, 1, 0, 0, 1, 3, 3, 4)
  )
  X <- lapply(1:3, function(i) {
    cbind(rnorm(9, mu$x, 1/5), rnorm(9, mu$y, 1/5))
  })
  do.call(rbind, X)
})
dist.mode("stats")
g1 <- supc1(X, r = .9, t = .75, implementation = "R")
dist.mode("wrong", wrong.dist)
g2 <- supc1(X, r = .9, t = .75, implementation = "R")
stopifnot(g2$iteration == 2)
stopifnot(max(g2$cluster) == 1) # because all distance is zero, so there is only one cluster
