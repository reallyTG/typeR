context("pprof-write")

test_that("roundtrip", {
  skip_if_not_installed("RProtoBuf")

  ds <- read_inst_pprof("proto/1.out.prof.pb.gz")
  # Validating on write

  path <- tempfile("profiler", fileext = ".pb.gz")
  write_pprof(ds, path)

  ds1 <- read_pprof(path)
  expect_error(validate_profile(ds1), NA)

  expect_identical(strip_dots(ds), strip_dots(ds1))
})
