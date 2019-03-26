

library(testthat)
library(synthACS)
library(parallel)

#------------------------------------------------------------------------------
context("combine smsm_set objects")
#------------------------------------------------------------------------------

test_that("expected errors and warnings are generated", {
  # create smsm_set object 
  cll <- all_geogs_add_constraint(attr_name= "age", attr_total_list= a_par, macro_micro= syn)
  cll <- all_geogs_add_constraint(attr_name= "gender", attr_total_list= g_par, macro_micro= syn, constraint_list_list= cll)
  cll <- all_geogs_add_constraint(attr_name= "edu_attain", attr_total_list= e_par, macro_micro= syn, constraint_list_list= cll)
  
  opt_geog <- all_geog_optimize_microdata(syn, prob_name= "p", constraint_list_list= cll, seed= 100L,
                                          p_accept= 0.4,  max_iter= 2L, verbose= FALSE)
  
  # ... and split it
  smsm_subset <- function(object, idx) {
    out <- list(best_fit= list(object$best_fit[[idx]]),
                tae= list(object$tae[[idx]]),
                call= NULL,
                p_accept= object$p_accept,
                iter= list(object$iter[[idx]]),
                max_iter= object$max_iter,
                tae_paths= object$tae_paths[[idx]],
                seed= object$seed,
                D= object$D)
    class(out) <- "smsm_set"
    return(out)
  }
  
  opt_geog_1 <- smsm_subset(opt_geog, 1)
  opt_geog_2 <- smsm_subset(opt_geog, 2)
  opt_geog_3 <- smsm_subset(opt_geog, 3)
  opt_geog_4 <- smsm_subset(opt_geog, 4)
  diamonds <- data.frame(
    carat= rexp(100),
    cut= factor(sample(c("A", "B", "C"), size= 100, replace= TRUE)),
    x= runif(100, min= 0, max= 10),
    y= runif(100, min= 0, max= 10),
    x= runif(100, min= 0, max= 10)
  )
  
  # insert some problems
  opt_geog_4$D <- 100L
  opt_geog_3$seed <- 2243L
  
  # ... test that returns problems
  expect_error(combine_smsm(diamonds, opt_geog_2, opt_geog_1))
  expect_error(combine_smsm(opt_geog_1, opt_geog_2, diamonds))
  
  expect_warning(combine_smsm(opt_geog_1, opt_geog_2, opt_geog_4)) # D
  expect_warning(combine_smsm(opt_geog_1, opt_geog_2, opt_geog_3)) # seed
  
  # insert different problems
  opt_geog_4$D <- 3
  opt_geog_4$p_accept <- 0.2
  opt_geog_3$seed <- 100L
  opt_geog_3$max_iter <- 1000L
  
  # ... test that returns problems
  expect_warning(combine_smsm(opt_geog_1, opt_geog_2, opt_geog_4)) # p_accept
  expect_warning(combine_smsm(opt_geog_1, opt_geog_2, opt_geog_3)) # max_iter
  
})

test_that("returns correctly", {
 # create smsm_set object 
  cll <- all_geogs_add_constraint(attr_name= "age", attr_total_list= a_par, macro_micro= syn)
  cll <- all_geogs_add_constraint(attr_name= "gender", attr_total_list= g_par, macro_micro= syn, constraint_list_list= cll)
  cll <- all_geogs_add_constraint(attr_name= "edu_attain", attr_total_list= e_par, macro_micro= syn, constraint_list_list= cll)
  
  opt_geog <- all_geog_optimize_microdata(syn, prob_name= "p", constraint_list_list= cll,
                                          max_iter= 2L, verbose= FALSE)
  
  # ... and split it
  smsm_subset <- function(object, idx) {
    out <- list(best_fit= list(object$best_fit[[idx]]),
                tae= list(object$tae[[idx]]),
                call= NULL,
                p_accept= object$p_accept,
                iter= list(object$iter[[idx]]),
                max_iter= object$max_iter,
                tae_paths= object$tae_paths[[idx]],
                seed= object$seed,
                D= object$D)
    class(out) <- "smsm_set"
    return(out)
  }
  
  opt_geog_1 <- smsm_subset(opt_geog, 1)
  opt_geog_2 <- smsm_subset(opt_geog, 2)
  opt_geog_3 <- smsm_subset(opt_geog, 3)
  opt_geog_4 <- smsm_subset(opt_geog, 4)
  
  # recombine / run function
  comb_smsm <- combine_smsm(opt_geog_1, opt_geog_2, opt_geog_3, opt_geog_4)
  
  # test output structure
  expect_equal(class(comb_smsm), "smsm_set")
  expect_equal(names(comb_smsm), names(opt_geog))
  expect_equal(length(comb_smsm$best_fit), 4L)
  expect_equal(length(comb_smsm$tae), 4L)
  expect_equal(length(comb_smsm$tae_paths), 4L)
  
  # test equality 
  expect_true(all.equal(opt_geog$best_fit,  comb_smsm$best_fit, check.attributes= FALSE))
  expect_true(all.equal(opt_geog$tae,       comb_smsm$tae, check.attributes= FALSE))
  expect_true(is.null(comb_smsm$call))
  expect_true(all.equal(opt_geog$iter,      comb_smsm$iter, check.attributes= FALSE))
  expect_equal(opt_geog$max_iter,  comb_smsm$max_iter)
  expect_true(all.equal(opt_geog$tae_paths, comb_smsm$tae_paths, check.attributes= FALSE))
  expect_equal(opt_geog$seed,      comb_smsm$seed)
  expect_equal(opt_geog$D,         comb_smsm$D)
})