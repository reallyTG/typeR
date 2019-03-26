context("Spectral estimation and clustering")

test_that("Correctly working 1D spectral estimation and clustering", {

  n <- 2^7
  d <- 2
  S <- 5

  ## rExamples and rARMA
  example <- rExamples1D(n, 2, "gaussian", return.ts = T, noise = "periodogram")
  expect_equal(dim(example$f), c(d, d, n))
  expect_equal(dim(example$P), c(d, d, n))
  expect_equal(dim(example$ts), c(2 * n, d))

  ts.sim <- rARMA(n, d, array(0, c(d, d, 2)), array(0, c(d, d, 2)), diag(d))
  expect_type(ts.sim$X, "double")
  expect_equal(dim(ts.sim$X), c(n, d))

  ## pdPgram
  pgram <- pdPgram(example$ts)
  expect_equal(dim(pgram$P), c(d, d, n))
  expect_equal(length(pgram$freq), n)
  expect_equal(pgram$P, example$P)

  ## WavTransf1D and InvWavTransf1D
  wt1 <- WavTransf1D(example$P, periodic = T)
  wt2 <- WavTransf1D(example$P, metric = "logEuclidean")

  expect_equal(length(unlist(wt1$D)), length(unlist(wt1$D.white)))
  expect_equal(length(unlist(wt2$D)), length(unlist(wt2$D.white)))
  expect_equal(InvWavTransf1D(wt1$D, wt1$M0, periodic = T), example$P)
  expect_equal(InvWavTransf1D(wt2$D, wt2$M0, metric = "logEuclidean"), example$P)

  ## pdCART
  wt1_den <- pdCART(wt1$D, wt1$D.white, order = 5, periodic = T)
  wt2_den <- pdCART(wt2$D, wt2$D.white, order = 5)

  expect_length(unlist(wt1_den$w), length(unlist(wt2_den$w)))
  expect_length(unlist(wt1_den$D_w), length(unlist(wt1$D)))
  expect_length(unlist(wt2_den$D_w), length(unlist(wt2$D)))

  ## pdSpecEst1D
  f1 <- pdSpecEst1D(example$P)
  f2 <- pdSpecEst1D(example$P, metric = "logEuclidean")

  expect_is(f1$f, is(example$P))
  expect_equal(dim(f1$f), dim(example$P))
  expect_type(f1$D[[1]], "complex")
  expect_type(f2$D[[1]], "complex")
  expect_length(unlist(f1$D), 300)
  expect_length(unlist(f2$D), 300)
  expect_length(c(f1$M0), 20)
  expect_length(c(f2$M0), 20)
  expect_type(f1$tree.weights[[1]], "logical")
  expect_type(f2$tree.weights[[1]], "logical")
  expect_length(unlist(f1$tree.weights), 62)
  expect_length(unlist(f2$tree.weights), 62)

  ## pdkMeans
  cl <- pdkMeans(example$P[,,1:10], K = 2)
  expect_true(all(cl$cl.assignments %in% c(0, 1)))
  expect_equal(sum(cl$cl.assignments), 10)
  expect_equal(dim(cl$cl.assignments), c(10, 2))
  expect_equal(dim(cl$cl.centroids), c(2, 2, 2))

  ## pdSpecClust1D
  P_s <- rExamples1D(n, 2, "gaussian", replicates = S)$P
  cl <- pdSpecClust1D(P_s, K = 2, metric = "logEuclidean")

  expect_equal(sum(cl$cl.prob), S)
  expect_length(cl$cl.centers.D, 2)
  expect_length(unlist(cl$cl.centers.D[[1]]), 300)
  expect_length(unlist(cl$cl.centers.D[[2]]), 300)
  expect_equal(dim(cl$cl.centers.M0[[1]]), dim(wt1$M0))
  expect_equal(dim(cl$cl.centers.M0[[2]]), dim(wt1$M0))
  expect_type(cl$cl.jmax, "double")

  ## pdSplineReg
  f3 <- pdSplineReg(example$f, example$f, lam = 0.1, Nd = 10, max.iter = 10)
  expect_equal(dim(f3$f), c(d,d,10))
  expect_type(f3$cost, "double")
  expect_type(f3$total_iter, "double")

})

test_that("Correctly working 2D spectral estimation and clustering", {

  n <- c(2^4, 2^4)
  d <- 2
  S <- 5

  ## rExamples2D
  example1 <- rExamples2D(n, d, example = "tvar")
  example2 <- rExamples2D(n, d, example = "smiley")

  expect_equal(dim(example1$f), c(d,d,n))
  expect_equal(dim(example1$P), c(d,d,n))
  expect_equal(dim(example2$f), c(d,d,n))
  expect_equal(dim(example2$P), c(d,d,n))

  ## pdPgram2
  pgram1 <- pdPgram2D(matrix(rnorm(d * 2^8), ncol = d), method = "dpss")
  pgram2 <- pdPgram2D(matrix(rnorm(d * (2^8 - 1)), ncol = d), method = "hermite")

  expect_length(pgram1$tf.grid$time, 2^4)
  expect_length(pgram2$tf.grid$time, 2^4)
  expect_length(pgram1$tf.grid$freq, 2^4)
  expect_length(pgram2$tf.grid$freq, 14)
  expect_equal(dim(pgram1$P), c(d, d, n))
  expect_equal(dim(pgram2$P), c(d, d, 16, 14))

  ## WavTransf2D and InvWavTransf2D
  wt1 <- WavTransf2D(example1$f)
  wt2 <- WavTransf2D(example2$f, metric = "logEuclidean")

  expect_equal(length(unlist(wt1$D)), length(unlist(wt1$D.white)))
  expect_equal(length(unlist(wt2$D)), length(unlist(wt2$D.white)))
  expect_equal(InvWavTransf2D(wt1$D, wt1$M0), example1$f)
  expect_equal(InvWavTransf2D(wt2$D, wt2$M0, metric = "logEuclidean"), example2$f)

  ## pdCART
  wt1_den <- pdCART(wt1$D, wt1$D.white, order = c(3, 3))
  wt2_den <- pdCART(wt2$D, wt2$D.white, order = c(3, 3))

  expect_length(unlist(wt1_den$w), length(unlist(wt2_den$w)))
  expect_length(unlist(wt1_den$D_w), length(unlist(wt1$D)))
  expect_length(unlist(wt2_den$D_w), length(unlist(wt2$D)))

  ## pdSpecEst2D
  f1 <- pdSpecEst2D(example1$P)
  f2 <- pdSpecEst2D(example2$P, metric = "logEuclidean")

  expect_is(f1$f, is(example1$P))
  expect_equal(dim(f1$f), dim(example1$P))
  expect_type(f1$D[[1]], "complex")
  expect_type(f2$D[[1]], "complex")
  expect_length(unlist(f1$D), 336)
  expect_length(unlist(f2$D), 336)
  expect_length(c(f1$M0), 4)
  expect_length(c(f2$M0), 4)
  expect_type(f1$tree.weights[[1]], "logical")
  expect_type(f2$tree.weights[[1]], "logical")
  expect_length(unlist(f1$tree.weights), 80)
  expect_length(unlist(f2$tree.weights), 80)
  expect_length(unlist(f1$D.raw), 336)
  expect_length(unlist(f2$D.raw), 336)

  ## pdSpecClust2D
  P_s <- rExamples2D(n, d, "tvar", S)$P
  cl <- pdSpecClust2D(P_s, K = 2, alpha = 0, metric = "logEuclidean")

  expect_equal(sum(cl$cl.prob), S)
  expect_length(cl$cl.centers.D, 2)
  expect_length(unlist(cl$cl.centers.D[[1]]), 336)
  expect_length(unlist(cl$cl.centers.D[[2]]), 336)
  expect_length(unlist(cl$cl.centers.M0[[1]]), 4)
  expect_length(unlist(cl$cl.centers.M0[[2]]), 4)
  expect_type(cl$cl.jmax, "double")

})





