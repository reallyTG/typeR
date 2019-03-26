library(tuneR)
context("empty bands")

test_that("check known missing bands in example file with chesmore2011 coding matrix", {
  wave <- readWave(system.file("extdata", "1.wav", package="tdsc"))
  data(chesmore2011)
  t <- tdsc(wave, coding_matrix = chesmore2011)
  b <- emptyBands(t,t)
  expect_equal(b$missing, 11)
})

