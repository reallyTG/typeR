context("Isotope math")

test_that("test that isotope ratios and abundances are calculated correctly", {
  # ratios
  expect_equal(lans2r:::iso.R(80, 20), 0.25)
  expect_equal(lans2r:::iso.R(800, 200), lans2r:::iso.R(800,200))
  expect_equal(lans2r:::iso.R(c(70, 80, 90), c(30, 20, 10)), c(30, 20, 10)/c(70, 80, 90))
  
  # fractional abundace
  expect_equal(lans2r:::iso.F(80, 20), 0.2)
  expect_equal(lans2r:::iso.F(c(70, 80, 90), c(30, 20, 10)), c(30, 20, 10)/(c(70, 80, 90) + c(30, 20, 10)))
})

test_that("test that shot noise error on ion counts is calcualted correctly", {
  expect_equal(lans2r:::iso.errN(c(10, 50, 90)), sqrt(c(10, 50, 90)))
  expect_equal(lans2r:::iso.relErrN(c(10, 50, 90)), 1/sqrt(c(10, 50, 90)))
})

test_that("test that shot noise error on isotope ratios is calcualted correctly", {
  expect_equal(lans2r:::iso.relErrR(90, 10), sqrt(1/10 + 1/90))
  expect_equal(lans2r:::iso.relErrR(90, 10), lans2r:::iso.relErrR(10, 90))
  expect_equal(lans2r:::iso.errR(90, 10), lans2r:::iso.R(90, 10) * lans2r:::iso.relErrR(10, 90))
})

test_that("test that shot noise error on isotope fractional abundances is calculated correctly", {
  expect_equal(lans2r:::iso.relErrF(90, 10), (1-10/(90+10)) * sqrt(1/90 + 1/10))
  expect_equal(lans2r:::iso.errF(90, 10), lans2r:::iso.F(90, 10) * lans2r:::iso.relErrF(90, 10))
})

test_that("test that shot noise error on delta values is calculated correctly", {
  expect_equal(lans2r:::iso.absErrD(90, 10), sqrt(2*(1/90 + 1/10)))
  expect_equal(lans2r:::iso.absErrD(90, 10), lans2r:::iso.absErrD(10, 90))
  expect_equal(lans2r:::iso.absErrDx(90, 10), 1000 * lans2r:::iso.absErrD(90, 10))
})