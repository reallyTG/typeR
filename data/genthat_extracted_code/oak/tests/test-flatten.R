context("Test 'flatten()' function")

test_that("function 'flatten()' works properly", {

  expect_identical(flatten(empty_tree()), list())
  
  tr0 = c_("Bob", "Carl", "Daniel")
  expect_identical(list(r_("Bob"), r_("Carl"), r_("Daniel")), 
                   flatten(tr0))
  
  tr1 = r_("Dimitri", s = list(c_("Enoc"), c_("Ferdinand")))
  expect_identical(list(r_("Dimitri"), r_("Enoc"), r_("Ferdinand")), 
                   flatten(tr1))
  
  tr1 = r_("Caroline", s = list(tr1))
  expect_identical(list(r_("Caroline"), r_("Dimitri"), r_("Enoc"), r_("Ferdinand")), 
                   flatten(tr1))
  
  tr1 = r_("Bill", s = list(tr1))
  expect_identical(list(r_("Bill") ,r_("Caroline"), r_("Dimitri"), 
                        r_("Enoc"), r_("Ferdinand")), 
                   flatten(tr1))
  
  tr2 = r_("Alice", s = list(tr0, tr1))
  expect_identical(list(r_("Alice"), r_("Bob"), r_("Carl"), r_("Daniel"), 
                        r_("Bill") ,r_("Caroline"), r_("Dimitri"), 
                        r_("Enoc"), r_("Ferdinand")), 
                   flatten(tr2))
  
  ## Unrooted tree
  tr3 = r_(s = list(tr2, c_("Grand-Mother", "Father", "Son")))
  expect_identical(list(r_("Alice"), r_("Bob"), r_("Carl"), r_("Daniel"), 
                        r_("Bill") ,r_("Caroline"), r_("Dimitri"), 
                        r_("Enoc"), r_("Ferdinand"),
                        r_("Grand-Mother"), r_("Father"), r_("Son")), 
                   flatten(tr3))
  
})
