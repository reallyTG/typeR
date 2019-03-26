context("rprof-from-ds")

test_that("roundtrip works", {
  ds <- read_inst_rprof("rprof/1.out")
  # Validating on convert

  ds1 <- rprof_to_ds(ds_to_rprof(ds))
  # Validating on convert
  ds2 <- rprof_to_ds(ds_to_rprof(ds1))
  expect_error(validate_profile(ds2), NA)

  expect_identical(strip_dots(ds1), strip_dots(ds2))
})
