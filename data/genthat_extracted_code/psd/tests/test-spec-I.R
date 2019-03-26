
##

context("Spectrum estimation tools -- I")

tol <- 0.07

test_that("classes are correct",{
  
  set.seed(1234)
  x <- rnorm(100)
  pd <- stats::spectrum(x, plot=FALSE)
  pc <- psdcore(x, plot = FALSE, verbose = FALSE)
  pa <- pspectrum(x, plot = FALSE, verbose = FALSE)
  pa_b <- pspectrum_basic(x, verbose = FALSE)
  
  expect_is(pd, 'spec')
  expect_is(pc, c('amt','spec'))
  expect_is(pa, c('amt','spec'))
  expect_is(pa_b, c('amt','spec'))
  
  expect_is(normalize(pd, verbose = FALSE), 'spec')
  expect_is(normalize(pa, verbose = FALSE), c('amt','spec'))
  
  expect_is(pd[['taper']], 'numeric')
  expect_is(pa[['taper']], 'tapers')
  
})

test_that("pgram.compare results",{
  set.seed(1234)
  x <- rnorm(100)
  xp <- pspectrum(x, plot = FALSE, verbose=FALSE)
  expect_is(xp, 'amt')
  xpc <- pgram_compare(xp)
  expect_is(xpc, 'list')
})


test_that("pspectrum results are accurate",{
  
  set.seed(1234)
  x <- rnorm(100)
  varx <- var(x)
  twovar <- 2*varx
  
  xt <- ts(x, frequency=1)
  xt2 <- ts(x, frequency=10)
  
  pc <- pspectrum(xt, plot = FALSE, verbose = FALSE)
  pc2 <- pspectrum(xt2, plot = FALSE, verbose = FALSE)
  
  # make sure Nyquist frequencies are correct
  fn <- max(pc[['freq']])
  fn2 <- max(pc2[['freq']])
  expect_equal(fn, frequency(xt)/2)
  expect_equal(fn2, frequency(xt2)/2)
  
  # and normalization is for a single-sided spectrum
  nf <- pc[['numfreq']]
  nf2 <- pc2[['numfreq']]
  psum <- sum(pc[['spec']])
  psum2 <- sum(pc2[['spec']])
  expect_equal(fn*psum/nf, varx, tolerance=tol)
  expect_equal(fn2*psum2/nf2, varx, tolerance=tol)
  
  # normalization effects
  pcn <- normalize(pc, verbose = FALSE)
  pcn2 <- normalize(pc2, verbose = FALSE)
  nnf <- pcn[['numfreq']]
  nnf2 <- pcn2[['numfreq']]
  psumn <- sum(pcn[['spec']])
  psumn2 <- sum(pcn2[['spec']])
  expect_equal(fn*psumn/nnf, varx, tolerance=tol)
  expect_equal(fn2*psumn2/nnf2, varx, tolerance=tol)
  
})

test_that("psdcore arguments are tested",{
  set.seed(1234)
  x <- rnorm(100)
  xp1 <- psdcore.default(X.d = x, X.frq = 1, plot = FALSE)
  xp2 <- psdcore.default(X.d = x, X.frq = -1, plot = FALSE)
  expect_is(xp1, 'spec')
  expect_is(xp2, 'spec')
  expect_equal(xp1,xp2)
  expect_error(psdcore.default(X.d = x, X.frq = "1", plot = FALSE))
})

test_that("psdcore results are accurate",{
  
  set.seed(1234)
  x <- rnorm(100)
  varx <- var(x)
  twovar <- 2*varx
  
  xt <- ts(x, frequency=1)
  xt2 <- ts(x, frequency=10)
  
  pc <- psdcore(xt, verbose = FALSE, plot = FALSE)
  pc2 <- psdcore(xt2, verbose = FALSE, plot = FALSE)
  
  # make sure Nyquist frequencies are correct
  fn <- max(pc[['freq']])
  fn2 <- max(pc2[['freq']])
  expect_equal(fn, frequency(xt)/2)
  expect_equal(fn2, frequency(xt2)/2)
  
  # and normalization is for a single-sided spectrum
  nf <- pc[['numfreq']]
  nf2 <- pc2[['numfreq']]
  psum <- sum(pc[['spec']])
  psum2 <- sum(pc2[['spec']])
  expect_equal(psum/nf, twovar, tolerance=tol)
  expect_equal(psum2/nf2, twovar, tolerance=tol)
  
})

test_that("prewhiten results are accurate",{
  
  set.seed(1234)
  x <- rnorm(100)
  varx <- var(x)
  twovar <- 2*varx
  
  xt <- ts(x, frequency=1)
  xt2 <- ts(x, frequency=10)
  
  pc <- prewhiten(xt, plot = FALSE, verbose = FALSE)
  pc2 <- prewhiten(xt2, plot = FALSE, verbose = FALSE)
  
  # make sure Nyquist frequencies are correct
  fn <- frequency(pc[['prew_lm']])
  fn2 <- frequency(pc2[['prew_lm']])
  expect_equal(fn, frequency(xt))
  expect_equal(fn2, frequency(xt2))
  
  pa <- prewhiten(xt, AR.max = 10, plot = FALSE, verbose = FALSE)
  pa2 <- prewhiten(xt2, AR.max = 10, plot = FALSE, verbose = FALSE)
  
  # make sure Nyquist frequencies are correct
  fn <- frequency(pa[['prew_ar']])
  fn2 <- frequency(pa2[['prew_ar']])
  expect_equal(fn, frequency(xt))
  expect_equal(fn2, frequency(xt2))
  
})

test_that("pilot_spec results are accurate",{
  
  set.seed(1234)
  x <- rnorm(100)
  varx <- var(x)
  twovar <- 2*varx
  
  xt <- ts(x, frequency=1)
  xt2 <- ts(x, frequency=10)
  
  pc <- pilot_spec(xt, plot = FALSE, verbose = FALSE)
  pc2 <- pilot_spec(xt2, plot = FALSE, verbose = FALSE)
  
  # make sure Nyquist frequencies are correct
  fn <- max(pc[['freq']])
  fn2 <- max(pc2[['freq']])

  expect_equal(fn, frequency(xt)/2)
  expect_equal(fn2, frequency(xt2)/2)
  
  # and normalization is for a single-sided spectrum
  nf <- pc[['numfreq']]
  nf2 <- pc2[['numfreq']]
  psum <- sum(pc[['spec']])
  psum2 <- sum(pc2[['spec']])
  expect_equal(psum/nf, twovar, tolerance=tol)
  expect_equal(psum2/nf2, twovar, tolerance=tol)
  
  expect_warning(pa <- pilot_spec(xt, remove.AR = TRUE, plot = FALSE, verbose = FALSE)) # because there is no AR structure!
  expect_warning(pa2 <- pilot_spec(xt2, remove.AR = TRUE, plot = FALSE, verbose = FALSE))
  
  # make sure Nyquist frequencies are correct
  fn <- max(pa[['freq']])
  fn2 <- max(pa2[['freq']])
  
  expect_equal(fn, frequency(xt)/2)
  expect_equal(fn2, frequency(xt2)/2)
  
})

test_that("check fast version",{
  set.seed(1234)
  x <- rnorm(100)
  expect_equal(psdcore(x, verbose = FALSE, plot = FALSE, fast = FALSE),
               psdcore(x, verbose = FALSE, plot = FALSE, fast = TRUE))
  #expect_equal(pspectrum(x, verbose = FALSE, plot = FALSE, fast = FALSE),
  #             pspectrum(x, verbose = FALSE, plot = FALSE, fast = TRUE))
  expect_equal(pilot_spec(x, verbose = FALSE, plot = FALSE, fast = FALSE),
               pilot_spec(x, verbose = FALSE, plot = FALSE, fast = TRUE))
  
  xt2 <- ts(x, frequency=10)
  expect_equal(psdcore(xt2, verbose = FALSE, plot = FALSE, fast = FALSE),
               psdcore(xt2, verbose = FALSE, plot = FALSE, fast = TRUE))
  #expect_equal(pspectrum(xt2, verbose = FALSE, plot = FALSE, fast = FALSE),
  #             pspectrum(xt2, verbose = FALSE, plot = FALSE, fast = TRUE))
  expect_equal(pilot_spec(xt2, verbose = FALSE, plot = FALSE, fast = FALSE),
               pilot_spec(xt2, verbose = FALSE, plot = FALSE, fast = TRUE))
})

##
