context("rprof-write")

test_that("roundtrip", {
  ds <- read_inst_rprof("rprof/1.out")
  # Validating on write

  ds <- rprof_to_ds(ds_to_rprof(ds))

  path <- tempfile("profiler", fileext = ".out")
  write_rprof(ds, path)

  ds1 <- read_rprof(path)
  expect_error(validate_profile(ds1), NA)

  expect_identical(strip_dots(ds), strip_dots(ds1))
})
