context("pub_providers")

test_that("pub_providers works", {
  expect_is(pub_providers(), "character")
  expect_true(any(grepl("elife", pub_providers())))
  expect_true(any(grepl("plos", pub_providers())))
  expect_true(any(grepl("entrez", pub_providers())))
  expect_true(any(grepl("elsevier", pub_providers())))
})

test_that("pub_providers fails well", {
  expect_error(pub_providers(5), "unused argument")
})
