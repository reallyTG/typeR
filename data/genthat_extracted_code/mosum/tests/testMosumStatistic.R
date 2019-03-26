N_TEST <- 5 # replications of tests with random input data

# test_that("MOSUM pValue and critical value are consistent", {
#   for (i in seq_len(N_TEST)) {
#     n <- floor(runif(1, 50, 1000))
#     G.left <- floor(runif(1, 5, n/8))
#     G.right <- floor(runif(1, 5, n/8))
#     expect_equal(mosum.pValue(mosum.criticalValue(n, G.left, G.right, 0), n, G.left, G.right), 0)
#     expect_equal(mosum.pValue(mosum.criticalValue(n, G.left, G.right, 1), n, G.left, G.right), 1)
#     alpha <- runif(1, 0.01, 0.99)
#     expect_equal(mosum.pValue(mosum.criticalValue(n, G.left, G.right, alpha), n, G.left, G.right), alpha)
#   }
# })
test_that("Asymmetric MOSUM bandwidth margins are consistent", {
  for (i in seq_len(N_TEST)) {
    n <- floor(runif(1, 50, 1000))
    x <- rnorm(n, 0, 1)
    # G = 0, n
    expect_error(mosum(x, G=0, G.right=10))
    expect_error(mosum(x, G=10, G.right=0))
    expect_error(mosum(x, G=n, G.right=10))
    expect_error(mosum(x, G=10, G.right=n))
    # G = n/2
    m.nHalf1 <- mosum(x, G=floor(n/2), boundary.extension=F)$stat
    expect_equal(sum(!is.na(m.nHalf1)),1 + (n %% 2))
    m.nHalf2 <- mosum(x, G=floor(n/2)+1, boundary.extension=F)$stat
    expect_true(all(is.na(m.nHalf2)))
    m.nHalf3 <- mosum(x, G=floor(n/2)+1,
                      G.right=floor(n/2), boundary.extension=F)$stat
    expect_equal(sum(!is.na(m.nHalf3)), n %% 2)
    m.nHalf4 <- mosum(x, G=floor(n/2),
                      G.right=floor(n/2)+1, boundary.extension=F)$stat
    expect_equal(sum(!is.na(m.nHalf4)), n %% 2)
    # G random
    G.left <- floor(runif(1, 5, n/8))
    G.right <- floor(runif(1, 5, n/8))
    m <- mosum(x, G=G.left, G.right=G.right,
               boundary.extension=F)$stat
    m2 <- mosum(x, G=G.left, G.right=G.right,
               boundary.extension=T)$stat
    margin <- c(1:(G.left-1), (n-G.right+1):n)
    inner <- G.left:(n-G.right)
    expect_equal(sort(c(margin, inner)), 1:n)
    expect_true(all(is.na(m[margin])))
    expect_false(any(is.na(m[inner])))
    expect_equal(sum(is.na(m2)), 0)
  }
})
test_that("Asymmetric MOSUM with symmetric bandwidth coincides with regular MOSUM", {
  for (i in seq_len(N_TEST)) {
    n <- floor(runif(1, 50, 1000))
    x <- rnorm(n, 0, 1)
    G <- floor(runif(1, 5, n/8))
    expect_equal(mosum(x, G)$stat, mosum(x, G=G, G.right=G)$stat)
  }
})