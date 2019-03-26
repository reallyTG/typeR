context("ROI")

suppressMessages(library('testthat'))
suppressMessages(library('dplyr'))
suppressMessages(library('magrittr'))
suppressMessages(library('purrr'))
suppressMessages(library('stringr'))
suppressMessages(library('tibble'))
suppressMessages(library('tidyr'))
suppressMessages(library('ROI.plugin.ecos'))
suppressMessages(library('fbar'))

test_that('toy model 1', {

  expanded <- reactiontbl_to_expanded(dplyr::data_frame(
    abbreviation = c('one', 'two'),
    equation = c('alpha -> beta', 'gamma -> delta'),
    lowbnd = c(-1,-1),
    uppbnd = c(3,3),
    obj_coef = c(1,0)))
  
  model <- expanded_to_ROI(expanded)
  
  expect_gte(length(ROI::ROI_applicable_solvers(model)),1)
  
  result <- ROI::ROI_solve(model)
  
  expect_equal(result$status$code, 0)
  expect_equal(result$objval, 0)
})

test_that('toy model 2', {

  expanded <- reactiontbl_to_expanded(dplyr::data_frame(
    abbreviation = c('one', 'two'),
    equation = c('alpha -> ', ' <-> alpha'),
    lowbnd = c(-1,-1),
    uppbnd = c(3,3),
    obj_coef = c(1,0)))
  
  model <- expanded_to_ROI(expanded)
  
  expect_gte(length(ROI::ROI_applicable_solvers(model)),1)
  
  result <- ROI::ROI_solve(model)
  
  expect_equal(result$status$code, 0)
  expect_equal(result$objval, 3)
})