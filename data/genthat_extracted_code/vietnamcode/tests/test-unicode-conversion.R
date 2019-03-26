context("Convert Vietnamese Unicode to ASCII")

test_that("Converts Unicode to ASCII", {
  expect_equal(convert_unicode_to_ascii("\u00C0"), "A")
  expect_equal(convert_unicode_to_ascii("\u1EF9"), "y")
  expect_equal(convert_unicode_to_ascii("\u00d0"), "D")
})
