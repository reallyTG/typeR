context("Basic C-HLI functions")

test_that("cfmini updates status", {
  status <- Integer(-1L)
  cfmini(status)
  expect_equal(status$value!=-1L,TRUE)
})

test_that("cfmfin updates status", {
  status <- Integer(-1L)
  cfmfin(status)
  expect_equal(status$value!=-1L,TRUE)
})

test_that("cfmver updates ver", {
  status <- Integer(-1L)
  ver <- Numeric(-1)
  cfmver(status,ver)
  expect_equal(ver$value>=11.5 || status$value==2L,TRUE)
})
