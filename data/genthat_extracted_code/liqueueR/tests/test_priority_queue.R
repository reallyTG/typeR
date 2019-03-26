context("Priority Queue")

test_that("new() creates a PriorityQueue", {
  expect_is(PriorityQueue$new(), "PriorityQueue")
})

test_that("push items onto PriorityQueue", {
  queue <<- PriorityQueue$new()
  queue$push("first", 1)
  queue$push("second", 2)
  queue$push("third", 1)
  queue$push("fourth", 3)
  expect_equal(queue$size(), 4)
})

test_that("retrieve priorities", {
  expect_equal(queue$priorities, c(3, 2, 1, 1))
})

test_that("retrieve data", {
  expect_equal(queue$data, as.list(c("fourth", "second", "first", "third")))
})

test_that("pop highest priority", {
  expect_equal(queue$pop(), "fourth")
})

library(iterators)

test_that("iterator functionality", {
  queue <<- Queue$new()
  for (n in 1:10) queue$push(n)
  #
  items = c()
  #
  i <- queue$iterator()
  #
  while (hasNext(i)) {
    items <- c(items, nextElem(i))
  }
  expect_equal(items, 1:10)
})