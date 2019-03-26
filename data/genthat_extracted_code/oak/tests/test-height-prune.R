context("Test 'height()' and 'prune()' functions")

test_that("functions 'height()' and 'prune()' works properly", {
  
  expect_identical(0L, height(empty_tree()))
  
  tr0 = c_("Bob", "Carl", "Daniel")
  expect_identical(3L, height(tr0))
  expect_identical(2L, height(prune(tr0, 2L)))
  expect_identical(1L, height(prune(tr0, 1L)))
  expect_identical(0L, height(prune(tr0, 0L)))
  
  tr1 = r_("Dimitri", s = list(c_("Enoc"), c_("Ferdinand")))
  expect_identical(2L, height(tr1))
  expect_identical(1L, height(prune(tr1, 1L)))
  expect_identical(0L, height(prune(tr1, 0L)))
  
  tr1 = r_("Caroline", s = list(tr1))
  expect_identical(3L, height(tr1))
  expect_identical(2L, height(prune(tr1, 2L)))
  expect_identical(1L, height(prune(tr1, 1L)))
  expect_identical(0L, height(prune(tr1, 0L)))
  
  tr1 = r_("Bill", s = list(tr1))
  expect_identical(4L, height(tr1))
  expect_identical(3L, height(prune(tr1, 3L)))
  expect_identical(2L, height(prune(tr1, 2L)))
  expect_identical(1L, height(prune(tr1, 1L)))
  expect_identical(0L, height(prune(tr1, 0L)))
  
  tr2 = r_("Alice", s = list(tr0, tr1))
  expect_identical(5L, height(tr2))
  expect_identical(4L, height(prune(tr2, 4L)))
  expect_identical(3L, height(prune(tr2, 3L)))
  expect_identical(2L, height(prune(tr2, 2L)))
  expect_identical(1L, height(prune(tr2, 1L)))
  expect_identical(0L, height(prune(tr2, 0L)))
  
  ## Unrooted tree
  tr3 = r_(s = list(tr2, c_("Grand-Mother", "Father", "Son")))
  expect_identical(5L, height(tr3))
  expect_identical(4L, height(prune(tr3, 4L)))
  expect_identical(3L, height(prune(tr3, 3L)))
  expect_identical(2L, height(prune(tr3, 2L)))
  expect_identical(1L, height(prune(tr3, 1L)))
  expect_identical(0L, height(prune(tr3, 0L)))
  
  height(tr3) <- 3
  expect_identical(3L, height(tr3))
  
})
