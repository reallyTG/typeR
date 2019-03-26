context("fsfi testing")


set.seed(8675309)
dat <- PROscorerTools::makeFakeData(n = 50, nitems = 19, values = 1:5,
                                    prefix = "fsfi")

datBad <- PROscorerTools::makeFakeData(n = 50, nitems = 19, values = 0:5,
                                    prefix = "fsfi")

test_that("fsfi: Error if 0 in range of incorrect items", {
  expect_error(fsfi(df = datBad, iprefix = "fsfi"),
               "items 1, 2, 15, and 16")
})

test_that("fsfi: Expect no error (silent) when correct input given", {
  expect_silent(fsfi(df = dat))
  expect_silent(fsfi(df = dat, keepNvalid = TRUE))
  expect_silent(fsfi(df = dat, iprefix = "fsfi"))
})
