context("Test label-like functions")

test_that("functions 'label()' and 'labels()' work properly", {
  
  expect_null(label(empty_tree()))
  expect_null(labels(empty_tree()))
  
  tr0 = c_("Bob", "Carl", "Daniel")
  expect_identical("Bob", label(tr0))
  expect_identical(c("Bob", "Carl", "Daniel"), labels(tr0))
  
  tr1 = c_("Bill", "Caroline", "Dimitri", "Enoc")
  expect_identical("Bill", label(tr1))
  expect_identical(c("Bill", "Caroline", "Dimitri", "Enoc"), labels(tr1))
  
  ## Rooted tree
  tr2 = r_("Alice", s = list(tr0, tr1))
  expect_identical("Alice", label(tr2))
  expect_identical(c("Alice", "Bob", "Carl", "Daniel", "Bill", "Caroline", 
                     "Dimitri", "Enoc"), 
                   labels(tr2))
  
  ## Unrooted tree
  tr3 = r_(s = list(tr2, c_("Grand-Mother", "Father", "Son")))
  expect_null(label(tr3))
  expect_identical(c("Alice", "Bob", "Carl", "Daniel", "Bill", "Caroline", 
                     "Dimitri", "Enoc", "Grand-Mother", "Father", "Son"), 
                   labels(tr3))

})
