context("Queue")

test_that("new() creates a Queue", {
  expect_is(Queue$new(), "Queue")
})

test_that("push items to Queue", {
  queue <<- Queue$new()
  queue$push("one")
  queue$push("two")
  queue$push("three")
  expect_equal(queue$size(), 3)
})

test_that("pop items off Queue", {
  expect_equal(queue$pop(), "one")
})

test_that("popping items reduces size of Queue", {
  queue$pop()
  expect_equal(queue$size(), 1)
})

test_that("peek at front of Queue", {
  expect_equal(queue$peek(), "three")
})

test_that("pop items off Queue", {
  expect_equal(queue$poll(), "three")
})

test_that("error when pop from empty Queue", {
  expect_error(queue$pop())
})

test_that("can peek multiple items", {
  queue <- Queue$new()
  sapply(letters, function(n) {queue$push(n)})
  expect_equal(queue$peek(4:7), as.list(letters[4:7]))
})
