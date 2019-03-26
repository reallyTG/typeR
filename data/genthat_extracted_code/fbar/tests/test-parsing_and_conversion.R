context("parsing_and_conversion")
suppressMessages(library(Matrix))

suppressMessages(library('testthat'))
suppressMessages(library('dplyr'))
suppressMessages(library('magrittr'))
suppressMessages(library('purrr'))
suppressMessages(library('stringr'))
suppressMessages(library('tibble'))
suppressMessages(library('tidyr'))
suppressMessages(library('ROI.plugin.ecos'))
suppressMessages(library('fbar'))

data("ecoli_core")

test_that("reactiontbl_to_expanded works on ecoli_core", {
  a <- reactiontbl_to_expanded(ecoli_core)
  
  expect_equal(length(a),3)
  expect_named(a, c('rxns','mets','stoich'), ignore.order = TRUE)
  expect_equal(nrow(a$stoich), 360)
  expect_equal(nrow(a$rxns), nrow(ecoli_core))
  expect_equal(nrow(a$mets), 72)
})

test_that('reactiontbl_to_expanded is opposite of expanded_to_reactiontbl', {
  mod <- ecoli_core %>%
    sample_frac() # shuffle, to check stability across row rearangements
  a <- reactiontbl_to_expanded(mod)
  b <- expanded_to_reactiontbl(a)
  
  expect_equal(nrow(b), nrow(mod))
  expect_named(b, names(mod), ignore.order = TRUE)
  expect_equal(mod %>% arrange(abbreviation) %>% select(-equation),
               b %>% arrange(abbreviation) %>% select(-equation))
})

test_that('order of reactions stable across expansion', {
  mod <- ecoli_core %>%
    sample_frac() # shuffle
  
  a <- mod %>%
    reactiontbl_to_expanded()
  
  expect_equal(a$rxns$abbreviation,
               mod$abbreviation
                 )
})

test_that('order of reactions stable across expansion and contraction', {
  mod <- ecoli_core %>%
    sample_frac() # shuffle
  
  a <- mod %>%
    reactiontbl_to_expanded() %>%
    expanded_to_ROI()
  
  expect_equal(a$constraints$L$dimnames$reactions,
               mod$abbreviation
  )
})
