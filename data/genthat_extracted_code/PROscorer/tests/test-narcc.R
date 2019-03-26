context("narcc testing")


set.seed(8675309)
datcc  <- PROscorerTools::makeFakeData(n = 30, nitems = 10, values = 0:3)
datnar <- PROscorerTools::makeFakeData(n = 30, nitems = 6,  values = 0:3)


test_that("narcc: Error if no or wrong 'whichScale' given", {
  expect_error(narcc(df = datcc), "use the 'whichScale' argument")
  expect_error(narcc(df = datcc, whichScale = "Cog"),
               "use the 'whichScale' argument")
})

test_that("narcc: Expect no error (silent) when correct input given", {
  expect_silent(narcc(df = datcc, whichScale = "CC"))
  expect_silent(narcc(df = datnar, whichScale = "NAR"))
  expect_silent(narcc(df = datcc, whichScale = "CC", keepNvalid = TRUE))
  expect_silent(narcc(df = datnar, whichScale = "NAR", keepNvalid = TRUE))
})
