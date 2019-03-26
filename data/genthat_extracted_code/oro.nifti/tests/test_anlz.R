context("anlz data")

img01 <- anlz(array(1:64, c(4,4,4,1)), datatype=4)
img02 <- anlz(array(64:1, c(4,4,4,1)), datatype=4)


test_that("operators", {
  expect_true(is.anlz(img01 + img02))
  expect_true(is.anlz(sqrt(2) * img01))
  expect_true(is.anlz(img02 / pi))
})

