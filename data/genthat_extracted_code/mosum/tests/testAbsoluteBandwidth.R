N_TEST <- 5 # replications of tests with random input data

test_that("MOSUM with relative and absolute symmetric bandwidths is consistent", {
  for (i in seq_len(N_TEST)) {
    n <- floor(runif(1, 50, 1000))
    x <- rnorm(n, 0, 1)
    G.rel <- runif(1, 0, 0.45)
    G.abs <- floor(n * G.rel)
    while (G.abs < 2) {
      G.rel <- runif(1, 0, 0.45)
      G.abs <- floor(n * G.rel)
    }
    m.rel <- mosum(x, G.rel)
    m.abs <- mosum(x, G.abs)
    expect_equal(m.rel$G.left, m.abs$G.left)
    expect_equal(m.rel$stat, m.abs$stat)
  }
})

test_that("MOSUM with relative and absolute asymmetric bandwidths is consistent", {
  for (i in seq_len(N_TEST)) {
    n <- floor(runif(1, 50, 1000))
    x <- rnorm(n, 0, 1)
    G.left.rel <- runif(1, 0, 0.45)
    G.left.abs <- floor(n * G.left.rel)
    while (G.left.abs < 2) {
      G.left.rel <- runif(1, 0, 0.45)
      G.left.abs <- floor(n * G.left.rel)
    }
    G.right.rel <- runif(1, 0, 0.45)
    G.right.abs <- floor(n * G.right.rel)
    while (G.right.abs < 2) {
      G.right.rel <- runif(1, 0, 0.45)
      G.right.abs <- floor(n * G.right.rel)
    }
    m.rel <- mosum(x, G.left.rel, G.right.rel)
    m.abs <- mosum(x, G.left.abs, G.right.abs)
    expect_equal(m.rel$G.left, m.abs$G.left)
    expect_equal(m.rel$G.right, m.abs$G.right)
    expect_equal(m.rel$stat, m.abs$stat)
  }
})

test_that("MOSUM CPTS with relative and absolute bandwidths is consistent", {
  for (i in seq_len(N_TEST)) {

    ts <- list(testData(model="blocks"),
               testData(model="fms"),
               testData(model="mix"),
               testData(model="stairs10"),
               testData(model="teeth10"))
    for (x in ts) {
      n <- length(x)
      G.left.rel <- runif(1, 0, 0.45)
      G.left.abs <- floor(n * G.left.rel)
      while (G.left.abs < 2) {
        G.left.rel <- runif(1, 0, 0.45)
        G.left.abs <- floor(n * G.left.rel)
      }
      G.right.rel <- runif(1, 0, 0.45)
      G.right.abs <- floor(n * G.right.rel)
      while (G.right.abs < 2) {
        G.right.rel <- runif(1, 0, 0.45)
        G.right.abs <- floor(n * G.right.rel)
      }
      m.rel <- mosum(x, G.left.rel, G.right.rel)
      m.abs <- mosum(x, G.left.abs, G.right.abs)
      expect_equal(m.rel$cpts, m.abs$cpts)
    }
  }
})
test_that("Multiscale CPTS bottom up with relative and absolute bandwidths is consistent", {
  for (i in seq_len(N_TEST)) {

    ts <- list(testData(model="blocks"),
               testData(model="fms"),
               testData(model="mix"),
               testData(model="stairs10"),
               testData(model="teeth10"))
    for (x in ts) {
      n <- length(x)
      G.left.rel <- runif(5, 0, 0.45)
      G.left.abs <- floor(n * G.left.rel)
      while (any(G.left.abs < max(20, 0.05*n))) {
        G.left.rel <- runif(5, 0, 0.45)
        G.left.abs <- floor(n * G.left.rel)
      }
      m.rel <- multiscale.bottomUp(x, G.left.rel)
      m.abs <- multiscale.bottomUp(x, G.left.abs)
      expect_equal(m.rel$cpts, m.abs$cpts)
      expect_equal(m.rel$pooled.cpts, m.abs$pooled.cpts)
    }
  }
})
test_that("Multiscale CPTS with relative and absolute bandwidths is consistent", {
  for (i in seq_len(N_TEST)) {
    ts <- list(testData(model="blocks"),
               testData(model="fms"),
               testData(model="mix"),
               testData(model="stairs10"),
               testData(model="teeth10"))
    for (x in ts) {
      n <- length(x)
      G.left.rel <- runif(5, 0, 0.45)
      G.left.abs <- floor(n * G.left.rel)
      while (any(G.left.abs < 2)) {
        G.left.rel <- runif(5, 0, 0.45)
        G.left.abs <- floor(n * G.left.rel)
      }
      m.rel <- multiscale.localPrune(x, G.left.rel)
      m.abs <- multiscale.localPrune(x, G.left.abs)
      expect_equal(m.rel$cpts, m.abs$cpts)
      expect_equal(m.rel$pooled.cpts, m.abs$pooled.cpts)
    }
  }
})

