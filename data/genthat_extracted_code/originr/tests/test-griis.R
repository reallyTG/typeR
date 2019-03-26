context("griis functions")

test_that("griis works", {
  skip_on_cran()

  sp <- c("Carpobrotus edulis")
  aa <- griis(name = sp)

  expect_is(aa, "data.frame")
  expect_named(aa, c('Species', 'Authority', 'Country', 'Kingdom',
                     'Environment.System', 'Origin', 'Evidence.of.Impacts',
                     'Verified', 'Date', 'Source'))
})
