context("Balanced data")

test_that("train/test mixed indexes", {
  set1 <- c(1,2,3,5,6,7,8,9,10,11,12,13,14,15,17,18,19,20)
  set2 <- c(FALSE,FALSE,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE)
  expect_error(balanced.train.and.test(set1, set2, train.perc = -1, join.all = F), 'train.perc argument must be between \\[1,0\\[')
  expect_error(balanced.train.and.test(set1, set2, train.perc = 1.1, join.all = F), 'train.perc argument must be between \\[1,0\\[')
  expect_error(balanced.train.and.test(set1, c('a','b'), train.perc = .5, join.all = F), 'Arguments must be either a logical or numeric vector')
})

test_that("train perct == 1", {
  set1 <- c(1,2,3,5,6,7,8,9,10,11,12,13,14,15,17,18,19,20)
  set2 <- c(FALSE,FALSE,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE)
  result <- balanced.train.and.test(set1, set2, train.perc = 1, join.all = F)

  expect_equal(length(result$train[[1]]), 18)
  expect_equal(length(result$train[[2]]), 2)
  expect_equal(length(result$test[[1]]), 18)
  expect_equal(length(result$test[[2]]), 2)
})

test_that("train/test mixed indexes", {
  set1 <- c(1,2,3,5,6,7,8,9,10,11,12,13,14,15,17,18,19,20)
  set2 <- c(FALSE,FALSE,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE)
  result <- balanced.train.and.test(set1, set2, train.perc = .9, join.all = F)

  expect_equal(length(result$train[[1]]), 16)
  expect_equal(length(result$train[[2]]), 1)
  expect_equal(length(result$test[[1]]), 2)
  expect_equal(length(result$test[[2]]), 1)
})

test_that("train/test mixed indexes (join)", {
  set1 <- c(1,2,3,5,6,7,8,9,10,11,12,13,14,15,17,18,19,20)
  set2 <- c(FALSE,FALSE,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE)
  result <- balanced.train.and.test(set1, set2, train.perc = .9, join.all = T)

  expect_equal(length(result$train), 17)
  expect_equal(length(result$test), 3)
})

test_that("train/test numeric indexes", {
  set1 <- c(1,2,3,5,6,7,8,9,10,11,12,13,14,15,17,18,19,20)
  set2 <- c(4,16)
  result <- balanced.train.and.test(set1, set2, train.perc = .9, join.all = F)

  expect_equal(length(result$train[[1]]), 16)
  expect_equal(length(result$train[[2]]), 1)
  expect_equal(length(result$test[[1]]), 2)
  expect_equal(length(result$test[[2]]), 1)
})

test_that("train/test numeric indexes (join)", {
  set1 <- c(1,2,3,5,6,7,8,9,10,11,12,13,14,15,17,18,19,20)
  set2 <- c(4,16)
  result <- balanced.train.and.test(set1, set2, train.perc = .9, join.all = T)

  expect_equal(length(result$train), 17)
  expect_equal(length(result$test), 3)
})



test_that("train/test logical indexes (join)", {
  set1 <- c(TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,T)
  set2 <- !set1

  result <- balanced.train.and.test(set1, set2, train.perc = .9, join.all = T)

  expect_equal(length(result$train), 17)
  expect_equal(length(result$test), 3)
})

test_that("train/test logical indexes", {
  set1 <- c(TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,T)
  set2 <- !set1
  result <- balanced.train.and.test(set1, set2, train.perc = .9, join.all = F)

  expect_equal(length(result$train[[1]]), 16)
  expect_equal(length(result$train[[2]]), 1)
  expect_equal(length(result$test[[1]]), 2)
  expect_equal(length(result$test[[2]]), 1)
})

test_that("finds sets with logical indexed vectors (join)", {
  set1 <- c(TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,T)
  set2 <- !set1

  result <- balanced.train.and.test(set1, set2, train.perc = .9, join.all = T)

  expect_equal(length(result$train), 17)
  expect_equal(length(result$test), 3)
})

context("Balanced cv folds")

test_that("Only one set", {
  set1 <- c(TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,T)
  result <- balanced.train.and.test(set1, nfolds = 10)

  expect_false(is.list(result$train))
  expect_false(is.list(result$test))
})

test_that('Creates nice cv folds', {

  result <- balanced.cv.folds(1:10, 1:3, nfolds = 2)
  #
  result.c <- table(result$output[[1]])
  expect_equal(length(result.c), 2)
  expect_equal(as.vector(result.c), c(5,5))
  #
  result.c <- table(result$output[[2]])
  expect_equal(length(result.c), 2)
  expect_equal(as.vector(result.c), c(2,1))
  #
  #
  result <- balanced.cv.folds(1:10, 1:3, nfolds = 3)
  #
  result.c <- table(result$output[[1]])
  expect_equal(length(result.c), 3)
  expect_equal(as.vector(result.c), c(4,3,3))
  #
  result.c <- table(result$output[[2]])
  expect_equal(length(result.c), 3)
  expect_equal(as.vector(result.c), c(1,1,1))
  #
  expect_warning(balanced.cv.folds(1:10, 1:3, nfolds = 10), 'Number of elements in vector [(][0-9]+[)] is less than \'nfolds\' [(][0-9]+[)]')
})
