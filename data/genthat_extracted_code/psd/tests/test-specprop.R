context("Spectral properties")

tap <- 1:10

set.seed(1234)
x <- cumsum(rnorm(100))
pd <- stats::spectrum(x, plot=FALSE)
pc <- psdcore(x, plot = FALSE, verbose = FALSE)
pa <- pspectrum(x, plot = FALSE, verbose = FALSE)


sp1 <- spectral_properties(tap)
sp2 <- spectral_properties(as.tapers(tap))
sp3 <- spectral_properties(pd)
sp4 <- spectral_properties(pc)
sp5 <- spectral_properties(pa)

test_that("spectral_properties inheritance",{
  expected <- 'data.frame'
  expect_is(sp1, expected)
  expect_is(sp2, expected)
  expect_is(sp3, expected)
  expect_is(sp4, expected)
  expect_is(sp5, expected)
})

test_that("spectral_properties equality",{
  expect_equal(sp1, sp2)
})


dof <- 2 * tap

sc1 <- spec_confint(dof)
sc2 <- spec_confint(as.tapers(tap))
sc3 <- spec_confint(pd)
sc4 <- spec_confint(pc)
sc5 <- spec_confint(pa)

test_that("spec_confint inheritance",{
  expected <- 'data.frame'
  expect_is(sc1, expected)
  expect_is(sc2, expected)
  expect_is(sc3, expected)
  expect_is(sc4, expected)
  expect_is(sc5, expected)
})

test_that("spec_confint equality",{
  expect_equal(sc1, sc2)
})

##