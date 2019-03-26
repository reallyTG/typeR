context("Basics")

# nothing useful occurs without FAME
# tests pass if FAME is not installed
test_that("open HLI", {
  rc <- open_hli()
  expect_equal(Sys.getenv("FAME") == "" || rc,TRUE)
})

test_that("get HLI version", {
  status <- rhli::Integer(-1)
  ver <- rhli::Numeric(-1)
  rhli::cfmver(status,ver)
  expect_equal(status$value==0 || status$value==2,TRUE)
  expect_equal(status$value==2 || ver$value!=-1,TRUE)
})

test_that("close HLI", {
  rc <- close_hli()
  expect_equal(Sys.getenv("FAME") == "" || rc,TRUE)
})


