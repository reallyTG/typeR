library(MittagLeffleR)
context("Do simulated random variables fall into the right quantile bins?")

tailvec <- seq(0.4, 0.9, 0.1)
scalevec <- 10^seq(-3,3,2)
pvec <- seq(0.1, 0.9, 0.1)
tol <- 1e-1
n <- 10000

test_that("rml() falls into the right qml() for Type 1", {
  for (tail in tailvec){
    for (scale in scalevec){
      r <- rml(n = n, tail = tail, scale = scale, second.type = FALSE)
      for (p in pvec){
        q <- qml(p = p, tail = tail, scale = scale, second.type = FALSE)
        hat_p <- sum(r <= q) / n
        expect_equal(object = hat_p, expected = p, tol = tol)
      }
    }
  }
})

test_that("rml() falls into the right qml() for Type 2", {
  for (tail in tailvec){
    for (scale in scalevec){
      r <- rml(n = n, tail = tail, scale = scale, second.type = TRUE)
      for (p in pvec){
        q <- qml(p = p, tail = tail, scale = scale, second.type = TRUE)
        hat_p <- sum(r <= q) / n
        expect_equal(object = hat_p, expected = p, tol = tol)
      }
    }
  }
})
