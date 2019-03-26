context("pprof-from-ds")

test_that("roundtrip works", {
  skip_if_not_installed("RProtoBuf")

  ds <- read_inst_pprof("proto/1.out.prof.pb.gz")
  # Validating on convert

  ds1 <- msg_to_ds(ds_to_msg(ds))
  # Validating on convert
  ds2 <- msg_to_ds(ds_to_msg(ds1))
  expect_error(validate_profile(ds2), NA)

  expect_identical(strip_dots(ds1), strip_dots(ds2))
})
