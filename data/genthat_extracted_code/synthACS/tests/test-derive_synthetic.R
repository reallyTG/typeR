

library(testthat)
library(synthACS)

context("derive synthetic microdata for geography set")

test_that("disaggregate_md works", {
  # load geography data, run disaggregation
  m_dat <- synthACS:::disaggregate_md(ca_dat$estimates)
  
  # test outputs
  expect_equal(length(m_dat), nrow(ca_dat$estimates[[1]]))
  expect_true(all(lapply(m_dat, length) == length(ca_dat$estimates)))
  expect_equal(names(m_dat[[1]]), names(ca_dat$estimates))
  expect_equal(sapply(m_dat[[10]], names), sapply(ca_dat$estimates, names))
  expect_true(all(unlist(lapply(m_dat[[30]], is.numeric))))
  
})


test_that("error checking", {
  diamonds <- data.frame(
    carat= rexp(100),
    cut= factor(sample(c("A", "B", "C"), size= 100, replace= TRUE)),
    x= runif(100, min= 0, max= 10),
    y= runif(100, min= 0, max= 10),
    x= runif(100, min= 0, max= 10)
  )
  expect_error(derive_synth_datasets(diamonds, parallel= FALSE))
  
  expect_error(derive_synth_datasets(ca_dat, parallel= TRUE, leave_cores= -1L))
  expect_error(derive_synth_datasets(ca_dat, parallel= TRUE, leave_cores= 2.5))
})


test_that("get correct results", {
  # comment out either parallel == TRUE or FALSE for testing purposes
  ## parallel == FALSE
  # syn <- derive_synth_datasets(ca_dat, parallel= FALSE)
  
  ## parallel == TRUE
  syn <- derive_synth_datasets(ca_dat, parallel= TRUE)
  
  # test class, structure, dimensions, etc
  expect_equal(class(syn), c("list", "synthACS"))
  expect_true(is.synthACS(syn))
  expect_true(all(unlist(lapply(syn, is.macro_micro))))
  expect_equal(nrow(ca_dat$estimates[[1]]), length(syn))
  expect_true(all(unlist(lapply(syn, length)) == 2))
  expect_true(all(unlist(lapply(syn, function(l) ncol(l[[2]]))) == length(ca_dat$estimates) + 1))
  expect_true(all.equal(lapply(syn, function(l) names(l[[2]])),
               replicate(length(syn), 
                 c("age", "gender", "marital_status", "edu_attain", "emp_status", "nativity", 
                   "pov_status", "geog_mobility", "ind_income", "race", "p"), simplify=FALSE), 
               check.attributes= FALSE))
  
  # test total probabilities
  expect_true(all.equal(unlist(lapply(syn, function(l) sum(l[[2]]$p))), rep(1,58), 
                        tolerance= 1e-14, check.attributes= FALSE))
  
})