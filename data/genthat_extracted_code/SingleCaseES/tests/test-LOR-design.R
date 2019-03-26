context("LOR interface")

A_data <- rbinom(10, 15, 0.3) * 100 / 15
B_data <- rbinom(12, 15, 0.2) * 100 / 15

test_that("LOR handles scales correctly.", {
  
  expect_warning(LOR(A_data, B_data, scale = "count"))
  expect_warning(LOR(A_data, B_data, scale = "rate"))
  expect_error(LOR(A_data + 100, B_data))
  
  LOR_pct <- LOR(A_data, B_data, scale = "percentage")  
  LOR_prop <- LOR(A_data / 100, B_data / 100, scale = "proportion")
  expect_is(LOR_pct, "data.frame")
  expect_equal(LOR_pct, LOR_prop)
  
  LOR_pct <- LOR(A_data, B_data, scale = "percentage", bias_correct = FALSE)  
  LOR_prop <- LOR(A_data / 100, B_data / 100, scale = "proportion", bias_correct = FALSE)
  expect_equal(LOR_pct, LOR_prop)
  
})
