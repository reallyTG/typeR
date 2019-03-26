context("Test 'descendants()' function")

test_that("function 'descendants()' works properly", {
  
  expect_identical(list(), descendants("TOTO", empty_tree()))
  
  tr0 = c_("Bob", "Carl", "Daniel")
  expect_identical(list(r_("Carl"), r_("Daniel")), descendants("Bob", tr0))
  expect_identical(list(r_("Daniel")), descendants("Carl", tr0))
  expect_identical(list(), descendants("Daniel", tr0))
  expect_identical(list(), descendants("TOTO", tr0))
  
  tr1 = r_("Dimitri", s = list(c_("Enoc"), c_("Ferdinand")))
  expect_identical(list(r_("Enoc"), r_("Ferdinand")), descendants("Dimitri", tr1))
  expect_identical(list(), descendants("Enoc", tr1))
  expect_identical(list(), descendants("Ferdinand", tr1))
  expect_identical(list(), descendants("TOTO", tr1))
  
  tr1 = r_("Caroline", s = list(tr1))
  expect_identical(list(r_("Dimitri"), r_("Enoc"), r_("Ferdinand")), descendants("Caroline", tr1))
  expect_identical(list(r_("Enoc"), r_("Ferdinand")), descendants("Dimitri", tr1))
  expect_identical(list(), descendants("Enoc", tr1))
  expect_identical(list(), descendants("Ferdinand", tr1))
  expect_identical(list(), descendants("TOTO", tr1))
  
  tr1 = r_("Bill", s = list(tr1))
  expect_identical(list(r_("Caroline"), r_("Dimitri"), r_("Enoc"), r_("Ferdinand")), descendants("Bill", tr1))
  expect_identical(list(r_("Dimitri"), r_("Enoc"), r_("Ferdinand")), descendants("Caroline", tr1))
  expect_identical(list(r_("Enoc"), r_("Ferdinand")), descendants("Dimitri", tr1))
  expect_identical(list(), descendants("Enoc", tr1))
  expect_identical(list(), descendants("Ferdinand", tr1))
  expect_identical(list(), descendants("TOTO", tr1))
  
  tr2 = r_("Alice", s = list(tr0, tr1))
  expect_identical(list(r_("Bob"), r_("Carl"), r_("Daniel"), r_("Bill"), 
                        r_("Caroline"), r_("Dimitri"), r_("Enoc"), r_("Ferdinand")), 
                   descendants("Alice", tr2))
  expect_identical(list(r_("Carl"), r_("Daniel")), 
                   descendants("Bob", tr2))
  expect_identical(list(r_("Daniel")), 
                   descendants("Carl", tr2))
  expect_identical(list(), 
                   descendants("Daniel", tr2))
  expect_identical(list(r_("Caroline"), r_("Dimitri"), r_("Enoc"), r_("Ferdinand")), 
                   descendants("Bill", tr2))
  expect_identical(list(r_("Dimitri"), r_("Enoc"), r_("Ferdinand")), 
                   descendants("Caroline", tr2))
  expect_identical(list(r_("Enoc"), r_("Ferdinand")), 
                   descendants("Dimitri", tr2))
  expect_identical(list(), 
                   descendants("Enoc", tr2))
  expect_identical(list(), 
                   descendants("Ferdinand", tr2))
  expect_identical(list(), 
                   descendants("TOTO", tr2))
  
  ## Unrooted tree
  tr3 = r_(s = list(tr2, c_("Grand-Mother", "Father", "Son")))
  expect_identical(list(r_("Bob"), r_("Carl"), r_("Daniel"), 
                        r_("Bill"), r_("Caroline"), r_("Dimitri"), r_("Enoc"), r_("Ferdinand")), 
                   descendants("Alice", tr3))
  expect_identical(list(r_("Carl"), r_("Daniel")), 
                   descendants("Bob", tr3))
  expect_identical(list(r_("Daniel")), 
                   descendants("Carl", tr3))
  expect_identical(list(), 
                   descendants("Daniel", tr3))
  expect_identical(list(r_("Caroline"), r_("Dimitri"), r_("Enoc"), r_("Ferdinand")), 
                   descendants("Bill", tr3))
  expect_identical(list(r_("Dimitri"), r_("Enoc"), r_("Ferdinand")), 
                   descendants("Caroline", tr3))
  expect_identical(list(r_("Enoc"), r_("Ferdinand")), 
                   descendants("Dimitri", tr3))
  expect_identical(list(), 
                   descendants("Enoc", tr3))
  expect_identical(list(), 
                   descendants("Ferdinand", tr3))
  expect_identical(list(r_("Father"), r_("Son")), 
                   descendants("Grand-Mother", tr3))
  expect_identical(list(r_("Son")), 
                   descendants("Father", tr3))
  expect_identical(list(), 
                   descendants("Son", tr3))
  expect_identical(list(), 
                   descendants("TOTO", tr3))
  
})

