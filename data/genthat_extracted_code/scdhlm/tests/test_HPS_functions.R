context("HPS estimation functions")

test_that("effect_size_ABk works for BAB designs", {
  data(Carson)
  CarsonHPS <- with(Carson, effect_size_ABk(outcome, treatment, case, phase, time))
  expect_true(is.list(CarsonHPS))
})

test_that("effect_size_ABk works with treatment factors", {
  
})

test_that("effect_size_ABk works with id factors", {
  
})

test_that("effect_size_ABk works with phase factors", {
  
})

test_that("effect_size_MB works with treatment factors", {
  
})

test_that("effect_size_MB works with id factors", {
  
})

test_that("Vectorized version of effect_size_ABk returns identical results", {
  
})

test_that("Vectorized version of effect_size_MB returns identical results", {
  
})

