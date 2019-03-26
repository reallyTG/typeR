
# test_that code for biod series of functions

# library(testthat)
# library(wiqid)
# test_file("test-biod.R")
# test_file(file.choose())

require(wiqid)

context("Biodiversity indices")
# =============================

test_that("biodSimpson gives same answers",  {
  data(Temburong)
  expect_that(round(biodSimpson(Temburong), 4), equals(81.1881))
  expect_that(round(biodSimpson(Temburong, FALSE), 4), equals(75.2273))
  data(KillarneyBirds)
  res <- apply(KillarneyBirds, 2, biodSimpson)
  expect_that(round(res, 4),
    is_equivalent_to(c( 8.7166,  7.9302,  6.0526,  9.1807,  4.5049,
                        5.8305,  9.9635, 12.1892, 10.4651)))
  res <- apply(KillarneyBirds, 2, biodSimpson, correct=FALSE)
  expect_that(round(res, 4),
    is_equivalent_to(c(8.3381, 7.6393, 5.7913, 8.5452, 4.3037, 5.6916,
                       9.0701,11.1416, 9.5602)))
  expect_that(round(biodSimpson(KillarneyBirds), 4), equals(8.4802))  # matrix input
  expect_that(round(biodSimpson(KillarneyBirds, FALSE), 4), equals(8.4257))
} )

test_that("biodShannon gives same answers",  {
  data(Temburong)
  #data(TemburongBA)
  expect_that(round(biodShannon(Temburong), 4), equals(148.4025))
  expect_that(round(biodShannon(TemburongBA), 4), equals(75.7914))
  data(KillarneyBirds)
  res <- apply(KillarneyBirds, 2, biodShannon)
  expect_that(round(res, 4),
    is_equivalent_to(c(11.1115, 10.8740,  7.6055, 10.4441,  5.5541,
                        7.8146, 11.5572, 14.5291, 12.2807)))
  expect_that(round(biodShannon(KillarneyBirds), 4), equals(11.9127))  # matrix input
} )

test_that("biodBerger gives same answers",  {
  data(Temburong)
  #data(TemburongBA)
  expect_that(round(biodBerger(Temburong), 4), equals(17.1525))
  expect_that(round(biodBerger(TemburongBA), 4), equals(7.4944))
  data(KillarneyBirds)
  res <- apply(KillarneyBirds, 2, biodBerger)
  expect_that(round(res, 4),
    is_equivalent_to(c(4.8571, 4.4390, 3.6129, 5.2381, 2.5000, 3.0462,
                       5.0556, 5.4091, 5.0000)))
  expect_that(round(biodBerger(KillarneyBirds), 4), equals(5.0524))  # matrix input
} )

test_that("biodBrillouin gives same answers",  {
  data(Temburong)
  expect_that(round(biodBrillouin(Temburong), 4), equals(102.604))
  data(KillarneyBirds)
  res <- apply(KillarneyBirds, 2, biodBrillouin)
  expect_that(round(res, 4),
    is_equivalent_to(c(9.3060, 9.1165, 6.3587, 8.5136, 4.7501, 6.9513,
                        8.9157, 11.2221, 9.5160)))
  expect_that(round(biodBrillouin(KillarneyBirds), 4), equals(11.304))  # matrix input
} )


