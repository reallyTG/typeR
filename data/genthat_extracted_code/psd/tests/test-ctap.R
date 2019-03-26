
##

context("Tapers class and methods")

taps.o = c(0,1:10,100)
taps = c(0,1:10,100)
ataps <- as.tapers(taps)
ataps.s <- as.tapers(taps, setspan = TRUE)
ms.taps <- minspan(taps)
ms.ataps <- minspan(ataps)

test_that("coercion is functioning",{
  
  expect_is(ataps, 'tapers')
  expect_is(ataps.s, 'tapers')
  
  expect_is(as.vector(ataps), 'integer')
  expect_is(as.vector(ataps.s), 'integer')
  
  expect_is(as.data.frame(ataps), 'data.frame')
  expect_is(as.data.frame(ataps.s), 'data.frame')
  
  expect_is(summary(ataps), 'summary.tapers')
  expect_is(summary(ataps.s), 'summary.tapers')
  
  expect_is(ms.taps, 'integer')
  expect_is(ms.ataps, 'tapers')
  
})

test_that("constrained-range is correct",{
  
  expect_equal(min(ataps),  1)
  expect_equal(max(ataps), max(taps))
  
  expect_equal(min(ataps.s), min(minspan(taps)))
  expect_equal(max(ataps.s), max(minspan(taps)))
  
})

test_that("parabolic weighting is applied correctly",{
  
  nk <- 10
  
  PW <- parabolic_weights(nk)
  PWr <- parabolic_weights_rcpp(nk)
  
  expect_is(PW[['ntap']], 'integer')
  expect_is(PWr[['ntap']], 'integer')
  
  expect_equal(PW[['ntap']], nk)
  expect_equal(PWr[['ntap']], nk)
  
  expect_equal(max(PW[['taper_seq']]), nk)
  expect_equal(max(PWr[['taper_seq']]), nk)
  
  expect_equal(sum(PW[['taper_weights']]), 1)
  expect_equal(sum(PWr[['taper_weights']]), 1)
  
  # num tapers is always integer
  nkd <- 10.99
  PWd <- parabolic_weights(nkd)
  PWdr <- parabolic_weights_rcpp(nkd)
  
  expect_is(PWd[['ntap']], 'integer')
  expect_is(PWdr[['ntap']], 'integer')
  
  expect_equal(PWd[['ntap']], PWdr[['ntap']])
  
  expect_equal(max(PWd[['taper_seq']]), as.integer(nkd))
  expect_equal(max(PWdr[['taper_seq']]), as.integer(nkd))
  
  expect_equal(sum(PWd[['taper_weights']]), 1)
  expect_equal(sum(PWdr[['taper_weights']]), 1)
  
})

test_that("environment variables are protected",{
  
  expect_equal(taps, taps.o)
  expect_equal(ms.taps, as.vector(ms.ataps))
  
  expect_is(ctap_simple(taps), 'integer')
  
  expect_is(ctap_simple(ataps), 'tapers')
  
  expect_warning(ctap_loess(taps)) # because a sequence is not given
  
  expect_is(suppressWarnings(ctap_loess(taps)), 'integer')
  
  expect_is(suppressWarnings(ctap_loess(ataps)), 'tapers')
  
  expect_error(constrain_tapers(taps, constraint.method = "some.nonexistent.method", verbose = FALSE))
  
  expect_is(constrain_tapers(taps, constraint.method = "simple.slope", verbose = FALSE), 'integer')
  expect_is(suppressWarnings(constrain_tapers(taps, constraint.method = "loess.smooth", verbose = FALSE)), 'integer')
  
  expect_equal(taps, constrain_tapers(taps, constraint.method = "none", verbose = FALSE))
  
  expect_is(constrain_tapers(ataps, verbose = FALSE), 'tapers')
  
})

test_that("constraint coercion is functioning",{
  
  expect_is(constrain_tapers(taps, verbose = FALSE), 'integer')
  expect_is(constrain_tapers(ataps, verbose = FALSE), 'tapers')
  
  expect_is(ctap_simple(taps), 'integer')
  expect_is(ctap_simple(ataps), 'tapers')
  
  expect_is(suppressWarnings(ctap_loess(taps)), 'integer')
  expect_is(suppressWarnings(ctap_loess(ataps)), 'tapers')
  
})

test_that("constrained-range is correct",{
  
  taps <- c(0,1:10,100)
  
  taps.c <- ctap_simple(taps, maxslope=1)
  taps.c2 <- ctap_simple(taps, maxslope=2)
  
  expect_equal(min(taps.c), 1)
  expect_equal(min(taps.c2), 1)
  expect_equal(max(taps.c), 11)
  expect_equal(max(taps.c2), 12)
  
})

test_that("bad input is handled correctly",{
  
  expect_error(rcpp_ctap_simple(NULL))
  
  expect_equal(ctap_simple(NA), 1)
  expect_warning(ctap_simple(Inf))
  expect_equal(ctap_simple(NULL), integer(0))
  expect_error(ctap_simple(1, maxslope=-1))
  
})

test_that("Length and positivity requirements are checked correctly",{
  
  expect_error(minspan(1))
  expect_error(minspan(0))
  expect_error(minspan(-1))
  expect_error(minspan(-1:0))
  
})

test_that("the result is limited by section length", {
  
  ms. <- minspan(0:2)
  expect_equal(min(ms.), 1)
  expect_equal(max(ms.), 1)
  
  ms. <- minspan(0:3)
  expect_equal(min(ms.), 1)
  expect_equal(max(ms.), 2)
  
  ms. <- minspan(0:4)
  expect_equal(min(ms.), 1)
  expect_equal(max(ms.), 2)
  
  ms. <- minspan(0:5)
  expect_equal(min(ms.), 1)
  expect_equal(max(ms.), 3)
  
  ms. <- minspan(0:6)
  expect_equal(min(ms.), 1)
  expect_equal(max(ms.), 3)
  
  ms. <- minspan(0:7)
  expect_equal(min(ms.), 1)
  expect_equal(max(ms.), 4)
})

test_that("strange values are dealt with", {
  
  expect_warning(ms. <- minspan(c(0:7,Inf)))
  expect_equal(min(ms.), 1)
  expect_equal(max(ms.), 4)
  expect_equal(length(ms.), 9)
  
  ms. <- minspan(c(0:7,NA))
  expect_equal(min(ms.), 1)
  expect_equal(max(ms.), 4)
  expect_equal(length(ms.), 9)
  
  ms. <- minspan(c(0:7,""))
  expect_equal(min(ms.), 1)
  expect_equal(max(ms.), 4)
  expect_equal(length(ms.), 9)
  
  ms. <- minspan(c(0:7,NULL))
  expect_equal(min(ms.), 1)
  expect_equal(max(ms.), 4)
  expect_equal(length(ms.), 8) # instead of 9
  
})

##
