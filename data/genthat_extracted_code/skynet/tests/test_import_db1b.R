library(skynet)

context("Test Import DB1B")

test_that("Import DB1B", {
  import_db1b(skynet_example("Coupon_2001Q1.csv"),
                      skynet_example("Ticket_2001Q1.csv"))
  expect_output(str(nrow(OD_2001Q1)), "1815")
  expect_length(OD_2001Q1, 21)
})

test_that("Test netImport",{
  expect_warning(netImport(skynet_example("Coupon_2001Q1.csv"),
                          skynet_example("Ticket_2001Q1.csv")))
})

