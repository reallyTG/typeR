library(easyVerification)
context('Conversion to probabilities')
xxx <- array(1:12, c(1,3,4))
xx <- t(array(1:15, c(3, 5)))
x <- 1:15
xna <- x
xna[3] <- NA
xxna <- xx
xxna[3,3] <- NA

test_that("input argument is matrix or vector and non-missing", {
  expect_error(convert2prob(xxx))
  expect_error(convert2prob(as.factor(x)))
  expect_error(convert2prob(as.data.frame(xx)))
  expect_error(convert2prob(NA))
})

test_that("argument is returned without modification", {
  expect_equal(convert2prob(x), x)
  expect_equal(convert2prob(xx), xx)
})

test_that("absolute threshold and probability are exchangeable", {
  expect_equal(convert2prob(xx, prob=0.5), convert2prob(xx, threshold=median(xx)))
  expect_equal(convert2prob(x, prob=0.5), convert2prob(x, threshold=median(x)))
  expect_equal(convert2prob(xx, prob=c(1/3, 2/3)), convert2prob(xx, threshold=quantile(xx, c(1/3,2/3))))
  expect_equal(convert2prob(x, prob=c(1/3,2/3)), convert2prob(x, threshold=quantile(x, c(1/3,2/3))))
})

test_that("missing value treatment", {
  expect_true(all(is.na(convert2prob(xna, prob=0.5)[,2]) == is.na(xna)))
  expect_true(all(is.na(convert2prob(xxna, prob=0.5)[,2]) == apply(is.na(xxna), 1, any)))
})

test_that("out-of-sample percentile", {
  expect_equal(convert2prob(x, threshold=1), convert2prob(x, threshold=1, ref.ind = indRef(nfcst=length(x), type='crossval')))
  expect_equal(convert2prob(x), convert2prob(x, ref.ind = indRef(nfcst=length(x), type='block')))
  expect_equal(convert2prob(x, prob=1:2/3), convert2prob(x, prob=1:2/3, ref.ind=indRef(nfcst=length(x), type='block')))
  expect_equal(convert2prob(x, prob=1:2/3), convert2prob(x, prob=1:2/3, ref.ind=indRef(nfcst=length(x), type='crossval')))
  expect_false(all(convert2prob(xx, prob=1:2/3) == convert2prob(xx, prob=1:2/3, ref.ind=indRef(nfcst=nrow(xx), type='crossval'))))
})
