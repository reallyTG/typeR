context("test-ubci_index")

test_that("colume check", {
  tem <- ubci_index("UBAI")
  col <- c("index","date","open","high","low","close")
  expect_equal(names(tem), col)
})

test_that("index check 1", {
  expect<-ubci_index_options()$index[sample(1:26,1)]
  tem <- ubci_index(expect)
  index <- unique(tem$index)
  expect_equal(index, expect)
})

test_that("index check 2", {
  expect<-ubci_index_options()$index[sample(1:26,1)]
  tem <- ubci_index(expect)
  index <- unique(tem$index)
  expect_equal(index, expect)
})

test_that("index check 3", {
  expect<-ubci_index_options()$index[sample(1:26,1)]
  tem <- ubci_index(expect)
  index <- unique(tem$index)
  expect_equal(index, expect)
})

test_that("date check from", {
  chk <- tail(ubci_index("UBAI", from = "2018-05-01"),1)$date
  expect_equal(chk, as.Date("2018-05-01"))
})

test_that("date check to", {
  chk <- head(ubci_index("UBAI", to = "2018-05-01"),1)$date
  expect_equal(chk, as.Date("2018-05-01"))
})

