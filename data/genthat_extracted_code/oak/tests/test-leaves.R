context("Test leave-like functions")

test_that("functions 'leaves()' and 'is_leafnode()' work properly", {

  expect_identical(list(), leaves(empty_tree()))
  
  tr0 = c_("Bob", "Carl", "Daniel")
  expect_identical(list(r_("Daniel")), leaves(tr0))
  expect_false(is_leafnode("Bob", tr0))
  expect_false(is_leafnode("Carl", tr0))
  expect_false(is_leafnode("TOTO", tr0))
  expect_true(is_leafnode("Daniel", tr0))
  
  tr1 = r_("Dimitri", s = list(c_("Enoc"), c_("Ferdinand")))
  expect_identical(list(r_("Enoc"), r_("Ferdinand")), leaves(tr1))
  expect_false(is_leafnode("Dimitri", tr1))
  expect_false(is_leafnode("TOTO", tr1))
  expect_true(is_leafnode("Enoc", tr1))
  expect_true(is_leafnode("Ferdinand", tr1))
  
  tr1 = r_("Caroline", s = list(tr1))
  expect_identical(list(r_("Enoc"), r_("Ferdinand")), leaves(tr1))
  expect_false(is_leafnode("Caroline", tr1))
  expect_false(is_leafnode("Dimitri", tr1))
  expect_false(is_leafnode("TOTO", tr1))
  expect_true(is_leafnode("Enoc", tr1))
  expect_true(is_leafnode("Ferdinand", tr1))
  
  tr1 = r_("Bill", s = list(tr1))
  expect_identical(list(r_("Enoc"), r_("Ferdinand")), leaves(tr1))
  expect_false(is_leafnode("Bill", tr1))
  expect_false(is_leafnode("Caroline", tr1))
  expect_false(is_leafnode("Dimitri", tr1))
  expect_false(is_leafnode("TOTO", tr1))
  expect_true(is_leafnode("Enoc", tr1))
  expect_true(is_leafnode("Ferdinand", tr1))
  
  tr2 = r_("Alice", s = list(tr0, tr1))
  expect_identical(list(r_("Daniel"), r_("Enoc"), r_("Ferdinand")), leaves(tr2))
  expect_false(is_leafnode("Alice", tr2))
  expect_false(is_leafnode("Bob", tr2))
  expect_false(is_leafnode("Carl", tr2))
  expect_false(is_leafnode("TOTO", tr2))
  expect_true(is_leafnode("Daniel", tr2))
  expect_false(is_leafnode("Bill", tr2))
  expect_false(is_leafnode("Caroline", tr2))
  expect_false(is_leafnode("Dimitri", tr2))
  expect_false(is_leafnode("TOTO", tr2))
  expect_true(is_leafnode("Enoc", tr2))
  expect_true(is_leafnode("Ferdinand", tr2))
  
  ## Unrooted tree
  tr3 = r_(s = list(tr2, c_("Grand-Mother", "Father", "Son")))
  expect_identical(list(r_("Daniel"), r_("Enoc"), r_("Ferdinand"), r_("Son")), leaves(tr3))
  expect_false(is_leafnode("Alice", tr3))
  expect_false(is_leafnode("Bob", tr3))
  expect_false(is_leafnode("Carl", tr3))
  expect_false(is_leafnode("TOTO", tr3))
  expect_true(is_leafnode("Daniel", tr3))
  expect_false(is_leafnode("Bill", tr3))
  expect_false(is_leafnode("Caroline", tr3))
  expect_false(is_leafnode("Dimitri", tr3))
  expect_false(is_leafnode("TOTO", tr3))
  expect_true(is_leafnode("Enoc", tr3))
  expect_true(is_leafnode("Ferdinand", tr3))
  expect_false(is_leafnode("Grand-Mother", tr3))
  expect_false(is_leafnode("Father", tr3))
  expect_true(is_leafnode("Son", tr3))
  
})


test_that("function 'cut_leaves()' works properly", {
  
  expect_identical(empty_tree(), cut_leaves(empty_tree()))
  
  tr0 = c_("Bob", "Carl", "Daniel")
  expect_identical(c_("Bob", "Carl"), cut_leaves(tr0))
  
  tr1 = r_("Dimitri", s = list(c_("Enoc"), c_("Ferdinand")))
  expect_identical(r_("Dimitri"), cut_leaves(tr1))
  
  tr1 = r_("Caroline", s = list(tr1))
  expect_identical(c_("Caroline", "Dimitri"), cut_leaves(tr1))
  
  tr1 = r_("Bill", s = list(tr1))
  expect_identical(list(r_("Enoc"), r_("Ferdinand")), leaves(tr1))
  
  tr2 = r_("Alice", s = list(tr0, tr1))
  expect_identical(r_("Alice", s = list(cut_leaves(tr0), cut_leaves(tr1))), 
                   cut_leaves(tr2))
  
  ## Unrooted tree
  tr3 = r_(s = list(tr2, c_("Grand-Mother", "Father", "Son")))
  expect_identical(r_(s = list(cut_leaves(tr2), c_("Grand-Mother", "Father"))), 
                   cut_leaves(tr3))
  
})
