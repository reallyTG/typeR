context("Tests queue")

test_that("Testing queue", {
  q = queue()
  for(i in 1:5) enqueue(q,i)
  expect_equal(dequeue(q), 1)
  expect_equal(dequeue(q), 2)
  enqueue(q, 15)
  expect_equal(dequeue(q), 3)
})
