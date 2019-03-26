context("summary")

library(uncmbb)

test_that("As of the end of 2016-2017 season, UNC has 6 championship seasons, Duke 5.", {
  expect_equal(dim(mbb_champ_season(unc, "NCAA"))[1], 6)
  expect_equal(dim(mbb_champ_season(duke, "NCAA"))[1], 5)
}
)

