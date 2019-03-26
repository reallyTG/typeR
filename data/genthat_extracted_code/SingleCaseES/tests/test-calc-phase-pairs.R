context("calc_phase_pairs() works properly.")

suppressWarnings(library(dplyr))
suppressWarnings(library(tidyr))

test_that("calc_phase_pairs() returns a vector the same length as the input.", {
  
  n_phases <- 20
  x <- rep(sample(LETTERS[1:3], size = n_phases, replace = TRUE), rpois(n_phases, lambda = 5))  
  phase_pairs <- calc_phase_pairs(x)
  
  expect_identical(length(x), length(phase_pairs))
  
  phase_reps <- table(rle(x)$values)
  expect_identical(as.vector(tapply(phase_pairs, x, max)), as.vector(phase_reps))
})


test_that("calc_phase_pairs() replicates Schmidt (2007), Thorne (2008) phase pairs.", {
  
  data("Schmidt2007")
  
  Schmidt2007 <- 
    Schmidt2007 %>%
    group_by(Behavior_type, Case_pseudonym) %>%
    mutate(phase_pair = calc_phase_pairs(Condition))
  
  expect_identical(Schmidt2007$Phase_num, Schmidt2007$phase_pair)
  
  data("Schmidt2012")
  
  Thorne_pairs <- 
    Thorne %>%
    group_by(Measure, Case) %>%
    mutate(phase_pair = calc_phase_pairs(Trt)) %>%
    group_by(Measure, Case, phase_pair) %>%
    count() %>%
    spread(phase_pair, n, fill = 0L)
  
  expect_identical(nrow(Thorne_pairs), 24L)
  expect_true(all(Thorne_pairs$`1` > 0))
  expect_true(all(Thorne_pairs$`2` > 0))
  
  trt_counts <- 
    Thorne_pairs %>%
    ungroup() %>%
    summarise_at(vars(`1`, `2`), sum)
  
  expect_identical(trt_counts$`1`, 384L)
  expect_identical(trt_counts$`2`, 392L)
  expect_identical(trt_counts$`1` + trt_counts$`2`, nrow(Thorne))
})
