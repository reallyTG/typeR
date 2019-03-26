library(skynet)

context("Test Import T100")

test_that("Import T100", {
  import_t100(skynet_example("T100_2011_mkt.csv"))
  expect_output(str(nrow(T100_2011_mkt)), "85")
  expect_length(T100_2011_mkt, 12)
})

test_that("Import T100 including non-scheduled flights", {
  import_t100(skynet_example("T100_2011_mkt.csv"), nonsch = TRUE)
  expect_output(str(nrow(T100_2011_mkt)), "100")
  expect_length(T100_2011_mkt, 12)
})


