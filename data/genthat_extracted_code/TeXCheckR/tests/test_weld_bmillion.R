context("weld bmillion")

test_that("Works on known small report", {
  # on.exit(file.remove("weld-bmillion-outfile.Rnw"))
  weld_bmillion("weld-bmillion.Rnw", outfile = "weld-bmillion-outfile.Rnw")
  expect_identical(readLines("weld-bmillion-correct.Rnw"), readLines("weld-bmillion-outfile.Rnw"))
})
