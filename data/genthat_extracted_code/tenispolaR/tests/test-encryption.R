library(tenispolaR)
context("test-encryption")

test_that("Message is from character class", {
  expect_that(encryption(2), throws_error())
})

test_that("TENIS-POLAR encryption", {
  expect_true("tenis-polar" == encryption("polar-tenis", "polar", "tenis"))
})

test_that("key_from class validation", {
  expect_that(encryption(x = "tenis-polar", key_from = 12345), throws_error())
})

test_that("key_to class validation", {
  expect_that(encryption(x = "tenis-polar", key_to = 12345), throws_error())
})

test_that("key_to and ket_from length", {
  expect_that(encryption(x = "tenis-polar", key_from = "tenis", key_to = "polares"), throws_error())
})
