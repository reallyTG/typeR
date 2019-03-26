context("Geometric functions and tools")

test_that("Correctly working geometric tools", {

  d <- 2
  p1 <- matrix(complex(real = rnorm(d^2), imaginary = rnorm(d^2)), nrow = d)
  p2 <- matrix(complex(real = rnorm(d^2), imaginary = rnorm(d^2)), nrow = d)
  P1 <- t(Conj(p1)) %*% p1
  P2 <- t(Conj(p2)) %*% p2
  P_chol <- Chol_C(P1, F, F)

  expect_equal(Expm(P1, Logm(P1, P2)), P2)
  expect_equal(c(Sqrt(P1) %*% iSqrt(P1)), as.complex(diag(d)))
  expect_equal(H.coeff(H.coeff(P1), inverse = T), P1)
  expect_equal(T_coeff_inv(T_coeff(P1, P2), P2), P1)
  expect_equal(Chol_C(P_chol, F, T), P1)
  expect_equal(E_chol(E_chol(P_chol), inverse = T), P_chol)

  expect_equal(pdMean(array(c(P1, P2), dim = c(d, d, 2))), Mid(P1, P2))
  expect_type(pdDist(P1, P2), "double")
  expect_type(pdDist(P1, P2, metric = "logEuclidean"), "double")

})

test_that("Correctly working data depth and rank-based tests", {

  # Data depth
  d <- 2
  mu <- diag(d)
  imu <- replicate(3, mu)

  ## Pointwise depth
  X1 <- replicate(10, Expm(mu, E_coeff_inv(rnorm(d^2))))
  dd1 <- pdDepth(y = mu, X = X1, method = "zonoid")
  dd2 <- pdDepth(mu, X1, "gdd")
  dd3 <- pdDepth(mu, X1, "spatial")
  dd4 <- pdDepth(X = X1, method = "zonoid")
  dd5 <- pdDepth(X = X1, method = "gdd")
  dd6 <- pdDepth(X = X1, method = "spatial")

  ## Integrated depth
  X2 <- replicate(10, replicate(3, Expm(mu, E_coeff_inv(rnorm(d^2)))))
  idd1 <- pdDepth(imu, X2, "zonoid")
  idd2 <- pdDepth(imu, X2, "gdd")
  idd3 <- pdDepth(imu, X2, "spatial")
  idd4 <- pdDepth(X = X2, method = "zonoid")
  idd5 <- pdDepth(X = X2, method = "gdd")
  idd6 <- pdDepth(X = X2, method = "spatial")

  expect_true(is.numeric(dd1) & (length(dd1) == 1))
  expect_true(is.numeric(dd2) & (length(dd2) == 1))
  expect_true(is.numeric(dd3) & (length(dd3) == 1))
  expect_true(is.numeric(idd1) & (length(idd1) == 1))
  expect_true(is.numeric(idd2) & (length(idd2) == 1))
  expect_true(is.numeric(idd3) & (length(idd3) == 1))

  expect_true(is.numeric(dd4) & (length(dd4) == 10))
  expect_true(is.numeric(dd5) & (length(dd5) == 10))
  expect_true(is.numeric(dd6) & (length(dd6) == 10))
  expect_true(is.numeric(idd4) & (length(idd4) == 10))
  expect_true(is.numeric(idd5) & (length(idd5) == 10))
  expect_true(is.numeric(idd6) & (length(idd6) == 10))

  # Rank-based tests
  rs <- pdRankTests(X1, c(5, 5), "rank.sum")
  irs <- pdRankTests(X2, c(5, 5), "rank.sum")
  kw <- pdRankTests(X1, c(5, 3, 2), "krusk.wall")
  ikw <- pdRankTests(X2, c(5, 3, 2), "krusk.wall")
  sr <- pdRankTests(X1, test = "signed.rank")
  bvn <- pdRankTests(X1, test = "bartels")
  ibvn <- pdRankTests(X2, test = "bartels")
  rs1 <- pdRankTests(X1, c(5, 5), "rank.sum", depth = "spatial", metric = "logEuclidean")
  irs1 <- pdRankTests(X2, c(5, 5), "rank.sum", depth = "spatial", metric = "logEuclidean")
  kw1 <- pdRankTests(X1, c(5, 3, 2), "krusk.wall", depth = "spatial", metric = "logEuclidean")
  ikw1 <- pdRankTests(X2, c(5, 3, 2), "krusk.wall", depth = "spatial", metric = "logEuclidean")
  sr1 <- pdRankTests(X1, test = "signed.rank", depth = "spatial", metric = "logEuclidean")
  bvn1 <- pdRankTests(X1, test = "bartels", depth = "spatial", metric = "logEuclidean")
  ibvn1 <- pdRankTests(X2, test = "bartels", depth = "spatial", metric = "logEuclidean")

  expect_true(is.list(rs) & (length(rs) == 5) & is.list(rs1) & (length(rs1) == 5))
  expect_match(rs[[1]], "Intrinsic Wilcoxon rank-sum")
  expect_match(rs[[4]], "Standard normal distribution")
  expect_true(is.list(irs) & (length(irs) == 5) & is.list(irs1) & (length(irs1) == 5))
  expect_match(irs[[1]], "Intrinsic Wilcoxon rank-sum")
  expect_match(irs[[4]], "Standard normal distribution")
  expect_true(is.list(kw) & (length(kw) == 5) & is.list(kw1) & (length(kw1) == 5))
  expect_true(is.list(ikw) & (length(ikw) == 5) & is.list(ikw1) & (length(ikw1) == 5))
  expect_true(is.list(sr) & (length(sr) == 4) & is.list(sr1) & (length(sr1) == 4))
  expect_match(sr[[4]], "Wilcoxon signed rank test")
  expect_true(is.list(bvn) & (length(bvn) == 5) & is.list(bvn1) & (length(bvn1) == 5))
  expect_match(bvn[[1]], "Intrinsic Bartels-von Neumann")
  expect_match(bvn[[4]], "Standard normal distribution")
  expect_true(is.list(ibvn) & (length(ibvn) == 5) & is.list(ibvn1) & (length(ibvn1) == 5))
  expect_match(ibvn[[1]], "Intrinsic Bartels-von Neumann")
  expect_match(ibvn[[4]], "Standard normal distribution")

})

