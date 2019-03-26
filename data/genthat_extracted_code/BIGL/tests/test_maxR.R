context("maxR")

test_that('statistics', {

  expect_silent(MaxR <- maxR(data, fit, transforms, B.B = NULL, B.CP = NULL,
                             Ymean = offAxisTable, CP = rs$CP, reps = reps))

  expect_that(inherits(MaxR, "maxR"), is_true())
  expect_that(exists("q", where = attributes(MaxR$Ymean)) &
              is.numeric(attr(MaxR$Ymean, "q")) , is_true())

  expect_that(exists("df0", where = attributes(MaxR$Ymean)) &
              is.numeric(attr(MaxR$Ymean, "df0")), is_true())

  expect_that(exists("cutoff", where = attributes(MaxR$Ymean)) &
              is.numeric(attr(MaxR$Ymean, "cutoff")), is_true())

  expect_that(exists("distr", where = attributes(MaxR$Ymean)) &
              inherits(attr(MaxR$Ymean, "distr"), "ecdf"), is_true())

})
