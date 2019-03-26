# source("./R/simulation_latent_trawl.R")
gig.implemented <- F # Flag for GIG implementation testing

context("Trawl functions")
test_that("Exp trawl function rho positive", {
  t <- 10
  rho <- -0.2
  expect_error(TrawlExp(t = t, rho = rho))
})

test_that("Exponential trawl function values", {
  t <- 10
  rho <- 0.2

  t.f.exp <- TrawlExp(t = t, rho = rho)
  expect_equal(t.f.exp(t), 1)
  expect_equal(t.f.exp(-Inf), 0)
  expect_equal(t.f.exp(t + 10), 0)
})

test_that("Exp primitive trawl function rho positive", {
  t <- 10
  rho <- -0.2
  expect_error(TrawlExpPrimitive(t = t, rho = rho))
})

test_that("Exponential primitive trawl function values", {
  t <- 10
  rho <- 0.2

  t.f.exp <- TrawlExpPrimitive(t = t, rho = rho)
  expect_equal(t.f.exp(t), 1/rho)
  expect_equal(t.f.exp(-Inf), 0)
  expect_equal(t.f.exp(t + 10), 1/rho)
})

test_that("CollectionTrawl output length", {
  times <- 1:500/500
  rho <- 0.2
  expect_equal(length(CollectionTrawl(times, params = list("rho"=rho), type = "exp")),
               length(times))
})

test_that("CollectionTrawl output exp trawl function", {
  times <- 10
  rho <- 0.2
  collection.trawl <- CollectionTrawl(times, params = list("rho"=rho), type = "exp")
  exp.t.function <- collection.trawl[[1]]
  tt.fct <- TrawlExp(t=times, rho=rho)
  tt.xs <- seq(0, 20, by=0.5)

  tt.ys <- tt.fct(tt.xs)
  tt.zs <- exp.t.function(tt.xs)

  expect_equal(tt.ys, tt.zs)
})

context("Slice area and reconstruction")
test_that("Slice area value", {
  timestamps <- 10:12
  rho <- 0.2
  tt.prim <- TrawlExpPrimitive(t=timestamps[1], rho=rho)
  theoretical.val <- 1/rho - exp(rho*(timestamps[1]-timestamps[2]))/rho
  expect_equal(SliceArea(i=1, j=1, times = timestamps, trawl.f.prim = tt.prim), theoretical.val)
})

test_that("Reconstruction with wrong marginals", {
  set.seed(42)

  # params:
  alpha <- 3
  beta <- 2
  kappa <- 0
  n.timestamps <- 10
  times <- 1:n.timestamps
  n <- 1

  rho <- 0.2
  trawl.fs <- CollectionTrawl(times = times, params = list(rho=rho), type = "exp")
  trawl.fs.prim <- CollectionTrawl(times = times, params = list(rho=rho), type = "exp", prim = T)

  # marginals:
  marg <- "wrong marg"

  expect_error(TrawlSliceReconstruct(alpha = alpha, beta = beta, times = times,
                                  marg.dist = marg, n = n, trawl.fs = trawl.fs,
                                  trawl.fs.prim = trawl.fs.prim))
})

test_that("Reconstruction using SliceArea for Gamma marginals", {
  set.seed(42)

  # params:
  alpha <- 3
  beta <- 2
  kappa <- 0
  n.timestamps <- 3000
  times <- 1:n.timestamps
  n <- 1

  rho <- 0.2
  trawl.fs <- CollectionTrawl(times = times, params = list(rho=rho), type = "exp")
  trawl.fs.prim <- CollectionTrawl(times = times, params = list(rho=rho), type = "exp", prim = T)

  # marginals:
  marg <- "gamma"

  values <- TrawlSliceReconstruct(alpha = alpha, beta = beta, times = times,
                        marg.dist = marg, n = n, trawl.fs = trawl.fs,
                        trawl.fs.prim = trawl.fs.prim)
  to.compare <- rgamma(shape=alpha, rate=beta, n = n.timestamps)
  expect_gte(ks.test(values, "pgamma", alpha, beta)$p.value, 0.05)
})

test_that("Reconstruction using SliceArea for Gaussian marginals", {
  set.seed(42)

  # params:
  alpha <- 3
  beta <- 2
  kappa <- 0
  n.timestamps <- 3000
  times <- 1:n.timestamps
  n <- 1

  rho <- 0.2
  trawl.fs <- CollectionTrawl(times = times, params = list(rho=rho), type = "exp")
  trawl.fs.prim <- CollectionTrawl(times = times, params = list(rho=rho), type = "exp", prim = T)

  # marginals:
  marg <- "gaussian"

  values <- TrawlSliceReconstruct(alpha = alpha, beta = beta, times = times,
                                  marg.dist = marg, n = n, trawl.fs = trawl.fs,
                                  trawl.fs.prim = trawl.fs.prim)
  to.compare <- rnorm(n = n.timestamps, alpha, beta)
  expect_gte(ks.test(values,to.compare)$p.value, 0.05)

  set.seed(42)
  marg <- "normal"

  values <- TrawlSliceReconstruct(alpha = alpha, beta = beta, times = times,
                                  marg.dist = marg, n = n, trawl.fs = trawl.fs,
                                  trawl.fs.prim = trawl.fs.prim)
  to.compare <- rnorm(n = n.timestamps, alpha, beta)
  expect_gte(ks.test(values,to.compare)$p.value, 0.05)
})

test_that("Reconstruction using SliceArea for GIG marginals", {
  if(!gig.implemented) skip("GIG not yet implemented")
  set.seed(42)

  requireNamespace("ghyp", quietly = TRUE) # test if ghyp is installed

  # params:
  alpha <- 3
  beta <- 2
  kappa <- 0
  n.timestamps <- 3000
  times <- 1:n.timestamps
  n <- 1

  rho <- 0.2
  trawl.fs <- CollectionTrawl(times = times, params = list(rho=rho), type = "exp")
  trawl.fs.prim <- CollectionTrawl(times = times, params = list(rho=rho), type = "exp", prim = T)

  # marginals:
  marg <- "gig"

  values <- TrawlSliceReconstruct(alpha = alpha, beta = beta, times = times,
                                  marg.dist = marg, n = n, trawl.fs = trawl.fs,
                                  trawl.fs.prim = trawl.fs.prim)
  to.compare <- ghyp::rgig(n = n.timestamps, lambda = -0.5, chi = alpha, psi = beta)
  expect_gte(ks.test(values, to.compare)$p.value, 0.05)
})

test_that("ACF for Gamma trawl", {
  set.seed(42)

  # params:
  alpha <- 3
  beta <- 2
  kappa <- 0
  n.timestamps <- 3000
  times <- 1:n.timestamps
  n <- 1

  depth.acf <- 30

  rho <- 0.2
  trawl.fs <- CollectionTrawl(times = times, params = list(rho=rho), type = "exp")
  trawl.fs.prim <- CollectionTrawl(times = times, params = list(rho=rho), type = "exp", prim = T)

  # marginals:
  marg <- "gamma"

  values <- TrawlSliceReconstruct(alpha = alpha, beta = beta, times = times,
                                  marg.dist = marg, n = n, trawl.fs = trawl.fs,
                                  trawl.fs.prim = trawl.fs.prim)
  acf.vals <- as.vector(acf(values, lag.max = depth.acf)$acf)

  expect_lte(mean((acf.vals - exp(-rho * 0:depth.acf))^2), 1e-2)
})


context("Simulation from mainstream functions")
test_that("Regression test rtrawl/TrawlSliceReconstruct", {
  set.seed(42)

  # params:
  alpha <- 3
  beta <- 2
  kappa <- 0
  n.timestamps <- 100
  times <- 1:n.timestamps
  deep.cols <- 30
  times.tsr <- 1:(n.timestamps+deep.cols)
  n <- 1

  rho <- 0.2
  trawl.fs <- CollectionTrawl(times = times.tsr, params = list(rho=rho), type = "exp")
  trawl.fs.prim <- CollectionTrawl(times = times.tsr, params = list(rho=rho), type = "exp", prim = T)

  # marginals:
  marg <- "gamma"

  # Creates manually the extra trawl functions to reconstruct with a buffer.
  tsr.vals <- TrawlSliceReconstruct(alpha = alpha, beta = beta, times = times.tsr,
                                  marg.dist = marg, n = n, trawl.fs = trawl.fs,
                                  trawl.fs.prim = trawl.fs.prim)

  # reset
  set.seed(42)
  rt.vals <- rtrawl(alpha = alpha, beta = beta, rho = rho, n = n,
                    times, times = times, marg.dist = marg, trawl.function = "exp")
  expect_equal(tsr.vals, rt.vals)
})

test_that("rtrawl using trawl functions", {
  set.seed(42)

  # params:
  alpha <- 3
  beta <- 2
  kappa <- 0
  deep.cols <- 30
  n.timestamps <- 100
  times <- 1:n.timestamps
  deep.cols <- 30
  times.custom <- 1:(n.timestamps+deep.cols)
  n <- 1

  rho <- 0.2
  trawl.fs <- CollectionTrawl(times = times.custom, params = list(rho=rho), type = "exp")
  trawl.fs.prim <- CollectionTrawl(times = times.custom, params = list(rho=rho), type = "exp", prim = T)

  # marginals:
  marg <- "gamma"

  tsr.vals <- rtrawl(alpha = alpha, beta = beta, times = times,
                    marg.dist = marg, n = n, trawl.fs = trawl.fs,
                    trawl.fs.prim = trawl.fs.prim)
  n.tsr.vals <- length(tsr.vals)
  expect_equal(n.timestamps, n.tsr.vals)
  # reset
  set.seed(42)
  rt.vals <- rtrawl(alpha = alpha, beta = beta, rho = rho, n = n,
                    times, times = times, marg.dist = marg, trawl.function = "exp")
  n.rt.vals <- length(rt.vals)
  expect_equal(n.timestamps, n.rt.vals)

  expect_equal(tsr.vals, rt.vals)
})


test_that("rlexceed GPD test", {
 requireNamespace("eva", quietly = T)
 alpha <- 3
 beta <- 6
 kappa <- 5
 rho <- 0.2
 n.timestamps <- 3000
 times <- 1:n.timestamps
 n <- 1

 rho <- 0.2
 values <- rlexceed(alpha = alpha, beta = beta, kappa = kappa, rho = rho,
                    times = times, n = n, transformation = F, marg.dist = "gamma",
                    trawl.function = "exp", deep_cols = deep.cols)

 expect_gte(eva::gpdAd(data = values[values>0], bootstrap = T, bootnum = 300,
                       allowParallel = F, numCores = 1)$p.value, 0.05)
 expect_gte(eva::gpdCvm(data = values[values>0], bootstrap = T, bootnum = 300,
                       allowParallel = F, numCores = 1)$p.value, 0.05)
})


