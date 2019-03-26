context("Test root-like functions")

test_that("functions 'root()', 'roots()', 'is.root()', 'is.rooted()' work properly", {
  
  tr0 = c_("Bob", "Carl", "Daniel")
  expect_true(is.rooted(tr0))
  expect_true(is.root("Bob", tr0))
  expect_false(is.root("Carl", tr0))
  expect_identical(r_("Bob"), root(tr0))
  
  tr1 = c_("Bill", "Caroline", "Dimitri", "Enoc")
  expect_true(is.rooted(tr1))
  expect_true(is.root("Bill", tr1))
  expect_false(is.root("Dimitri", tr1))
  expect_false(is.root("Toto", tr1))
  expect_identical(r_("Bill"), root(tr1))
  
  ## Rooted tree
  tr2 = r_("Alice", s = list(tr0, tr1))
  expect_true(is.rooted(tr2))
  expect_true(is.root("Alice", tr2))
  expect_false(is.root("Bob", tr2))
  expect_identical(r_("Alice"), root(tr2))
  expect_identical(list(r_("Alice")), roots(tr2))
  
  ## Unrooted tree
  tr3 = r_(s = list(tr2, c_("Grand-Mother", "Father", "Son")))
  expect_false(is.rooted(tr3))
  expect_identical(list(r_("Alice"), r_("Grand-Mother")), roots(tr3))
  expect_error(root(tr3))
  
})
