
library(testthat)
library(synthACS)

#------------------------------------------------------------------------------
context("adding constraints - all geogs")
#------------------------------------------------------------------------------

test_that("can add 1 constraint to all geogs", {
  # create test inputs
  cll <- all_geogs_add_constraint(attr_name= "age", attr_total_list= a_par, macro_micro= syn)
  
  # test structure output
  expect_true(is.list(cll))
  expect_true(all(unlist(lapply(cll, is.list))))
  expect_true(all.equal(unlist(lapply(cll, names)), rep("age", length(cll)), check.attributes= FALSE))
})


test_that("can add 2+ constraints to all geogs", {
  # create test inputs
  cll <- all_geogs_add_constraint(attr_name= "age", attr_total_list= a_par, macro_micro= syn)
  cll <- all_geogs_add_constraint(attr_name= "gender", attr_total_list= g_par, macro_micro= syn, constraint_list_list= cll)
  cll <- all_geogs_add_constraint(attr_name= "edu_attain", attr_total_list= e_par, macro_micro= syn, constraint_list_list= cll)
  
  # test structure output
  expect_equal(length(cll), length(syn))
  expect_true(all(unlist(lapply(cll, is.list))))
  expect_true(all(unlist(lapply(cll, function(l) names(l) == c("age", "gender", "edu_attain")))))
  
})

#------------------------------------------------------------------------------
context("can simulate anneal - all geogs in parallel")
#------------------------------------------------------------------------------

test_that("optimization works", {
  # create test inputs
  cll <- all_geogs_add_constraint(attr_name= "age", attr_total_list= a_par, macro_micro= syn)
  cll <- all_geogs_add_constraint(attr_name= "gender", attr_total_list= g_par, macro_micro= syn, constraint_list_list= cll)
  cll <- all_geogs_add_constraint(attr_name= "edu_attain", attr_total_list= e_par, macro_micro= syn, constraint_list_list= cll)
  
  opt_geog <- all_geog_optimize_microdata(syn, prob_name= "p", constraint_list_list= cll,
                                          max_iter= 10L, verbose= FALSE)
  
  # test output
  expect_true(is.list(opt_geog$best_fit))
  expect_true(is.list(opt_geog$tae))
  expect_true(is.list(opt_geog$iter))
  expect_true(is.list(opt_geog$tae_paths))
  
  expect_true(all(unlist(lapply(opt_geog$best_fit, is.data.table))))
  expect_true(all(unlist(opt_geog$iter) <= 10L))
  expect_true(all(unlist(opt_geog$tae) >= 0))
  expect_true(all(unlist(opt_geog$tae) %% 1 == 0))
  
})