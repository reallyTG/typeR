context("Test 'ancestors()' function")

test_that("function 'ancestors()' works properly", {
  
  expect_identical(list(), ancestors("TOTO", empty_tree()))
  
  tr0 = c_("Bob", "Carl", "Daniel")
  expect_identical(list(), ancestors("Bob", tr0))
  expect_identical(list(r_("Bob")), ancestors("Carl", tr0))
  expect_identical(list(r_("Carl"), r_("Bob")), ancestors("Daniel", tr0))
  expect_identical(list(), ancestors("TOTO", tr0))
  
  tr1 = r_("Dimitri", s = list(c_("Enoc"), c_("Ferdinand")))
  expect_identical(list(), ancestors("Dimitri", tr1))
  expect_identical(list(r_("Dimitri")), ancestors("Enoc", tr1))
  expect_identical(list(r_("Dimitri")), ancestors("Ferdinand", tr1))
  expect_identical(list(), ancestors("TOTO", tr1))
  
  tr1 = r_("Caroline", s = list(tr1))
  expect_identical(list(), ancestors("Caroline", tr1))
  expect_identical(list(r_("Caroline")), ancestors("Dimitri", tr1))
  expect_identical(list(r_("Dimitri"), r_("Caroline")), ancestors("Enoc", tr1))
  expect_identical(list(r_("Dimitri"), r_("Caroline")), ancestors("Ferdinand", tr1))
  expect_identical(list(), ancestors("TOTO", tr1))
  
  tr1 = r_("Bill", s = list(tr1))
  expect_identical(list(), ancestors("Bill", tr1))
  expect_identical(list(r_("Bill")), ancestors("Caroline", tr1))
  expect_identical(list(r_("Caroline"), r_("Bill")), ancestors("Dimitri", tr1))
  expect_identical(list(r_("Dimitri"), r_("Caroline"), r_("Bill")), ancestors("Enoc", tr1))
  expect_identical(list(r_("Dimitri"), r_("Caroline"), r_("Bill")), ancestors("Ferdinand", tr1))
  expect_identical(list(), ancestors("TOTO", tr1))
  
  tr2 = r_("Alice", s = list(tr0, tr1))
  expect_identical(list(), ancestors("Alice", tr2))
  expect_identical(list(r_("Alice")), ancestors("Bob", tr2))
  expect_identical(list(r_("Bob"), r_("Alice")), ancestors("Carl", tr2))
  expect_identical(list(r_("Carl"), r_("Bob"), r_("Alice")), ancestors("Daniel", tr2))
  expect_identical(list(r_("Alice")), ancestors("Bill", tr2))
  expect_identical(list(r_("Bill"), r_("Alice")), ancestors("Caroline", tr2))
  expect_identical(list(r_("Caroline"), r_("Bill"), r_("Alice")), ancestors("Dimitri", tr2))
  expect_identical(list(r_("Dimitri"), r_("Caroline"), r_("Bill"), r_("Alice")), ancestors("Enoc", tr2))
  expect_identical(list(r_("Dimitri"), r_("Caroline"), r_("Bill"), r_("Alice")), ancestors("Ferdinand", tr2))
  expect_identical(list(), ancestors("TOTO", tr2))
  
  ## Unrooted tree
  tr3 = r_(s = list(tr2, c_("Grand-Mother", "Father", "Son")))
  expect_identical(list(), ancestors("Alice", tr3))
  expect_identical(list(r_("Alice")), ancestors("Bob", tr3))
  expect_identical(list(r_("Bob"), r_("Alice")), ancestors("Carl", tr3))
  expect_identical(list(r_("Carl"), r_("Bob"), r_("Alice")), ancestors("Daniel", tr3))
  expect_identical(list(r_("Alice")), ancestors("Bill", tr3))
  expect_identical(list(r_("Bill"), r_("Alice")), ancestors("Caroline", tr3))
  expect_identical(list(r_("Caroline"), r_("Bill"), r_("Alice")), ancestors("Dimitri", tr3))
  expect_identical(list(r_("Dimitri"), r_("Caroline"), r_("Bill"), r_("Alice")), ancestors("Enoc", tr3))
  expect_identical(list(r_("Dimitri"), r_("Caroline"), r_("Bill"), r_("Alice")), ancestors("Ferdinand", tr3))
  expect_identical(list(), ancestors("Grand-Mother", tr3))
  expect_identical(list(r_("Grand-Mother")), ancestors("Father", tr3))
  expect_identical(list(r_("Father"), r_("Grand-Mother")), ancestors("Son", tr3))
  expect_identical(list(), ancestors("TOTO", tr3))
  
})

