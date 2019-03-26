context("Improvement arguments work properly.")

library(dplyr)

symmetric_ES <- c("LRRd","LRRi","SMD","Tau","NAP","PEM")

data(Thorne)

#------------------------------
# count data
#------------------------------

Thorne_counts <- dplyr::filter(Thorne, Procedure == "count")

symmetric_ES_counts <- 
  batch_calc_ES(
    Thorne_counts, 
    grouping = Case, 
    condition = "Trt", 
    baseline_phase = 0, 
    session_number = "Session_number", 
    outcome = "Outcome",
    ES = symmetric_ES,
    std_dev = "pool",
    improvement = "decrease",
    scale = "count"
)


test_that("Symmetric ES with count data have opposite sign if direction of improvement changes.", {

  switch_improvement_counts <- 
    batch_calc_ES(
      Thorne_counts, 
      grouping = Case,
      condition = "Trt",
      baseline_phase = 0,
      session_number = "Session_number",
      outcome = "Outcome",
      ES = symmetric_ES,
      std_dev = "pool",
      improvement = "increase",
      scale = "count"
    ) %>%
    mutate(
      Est = ifelse(ES %in% c("LRRd","LRRi","SMD","Tau"), -Est, 1 - Est),
      CI_L = ifelse(ES %in% c("LRRd","LRRi","SMD","Tau"), -CI_upper, 1 - CI_upper),
      CI_U = ifelse(ES %in% c("LRRd","LRRi","SMD","Tau"), -CI_lower, 1 - CI_lower)
    ) %>%
    select(-CI_lower, -CI_upper) %>%
    rename(CI_lower = CI_L, CI_upper = CI_U)
  
  expect_identical(symmetric_ES_counts$Case, switch_improvement_counts$Case)
  expect_identical(symmetric_ES_counts$ES, switch_improvement_counts$ES)
  expect_equal(symmetric_ES_counts$Est, switch_improvement_counts$Est)
  expect_equal(symmetric_ES_counts$SE, switch_improvement_counts$SE)
  expect_equal(symmetric_ES_counts$CI_lower, switch_improvement_counts$CI_lower)
  expect_equal(symmetric_ES_counts$CI_upper, switch_improvement_counts$CI_upper)
  
})

test_that("For symmetric ES with count data, flipping improvement direction and phase coding yields identical results", {
  
  switch_baseline_counts <- 
    batch_calc_ES(
      Thorne_counts, 
      grouping = Case,
      condition = "Trt",
      baseline_phase = 1,
      session_number = "Session_number",
      outcome = "Outcome",
      ES = dplyr::setdiff(symmetric_ES,"PEM"),
      std_dev = "pool",
      improvement = "increase",
      scale = "count"
    )
  
  symmetric_ES_counts_no_PEM <- dplyr::filter(symmetric_ES_counts, ES != "PEM")
  
  expect_identical(symmetric_ES_counts_no_PEM$Case, switch_baseline_counts$Case)
  expect_identical(symmetric_ES_counts_no_PEM$ES, switch_baseline_counts$ES)
  expect_equal(symmetric_ES_counts_no_PEM$Est, switch_baseline_counts$Est)
  expect_equal(symmetric_ES_counts_no_PEM$SE, switch_baseline_counts$SE)
  expect_equal(symmetric_ES_counts_no_PEM$CI_lower, switch_baseline_counts$CI_lower)
  expect_equal(symmetric_ES_counts_no_PEM$CI_upper, switch_baseline_counts$CI_upper)
  
})


#------------------------------
# percentage data
#------------------------------

Thorne_pct <- dplyr::filter(Thorne, Procedure == "other")

symmetric_ES_pct <- 
  batch_calc_ES(
    Thorne_pct, 
    grouping = Case, 
    condition = "Trt", 
    baseline_phase = 0, 
    session_number = "Session_number", 
    outcome = "Outcome",
    ES = symmetric_ES,
    std_dev = "pool",
    improvement = "increase",
    scale = "percentage"
  ) %>%
  arrange(Case, ES)

test_that("Symmetric ES with percentage data have opposite sign if direction of improvement changes.", {
  
  switch_improvement_pct <- 
    batch_calc_ES(
      Thorne_pct, 
      grouping = Case,
      condition = "Trt",
      baseline_phase = 0,
      session_number = "Session_number",
      outcome = "Outcome",
      ES = symmetric_ES,
      std_dev = "pool",
      improvement = "decrease",
      scale = "percentage"
    ) %>%
    mutate(
      ES = recode(ES, LRRd = "LRRi", LRRi = "LRRd"),
      Est = case_when(
        ES %in% c("SMD","Tau") ~ -Est, 
        ES %in% c("PEM","NAP") ~ 1 - Est,
        TRUE ~ Est
      ),
      CI_L = case_when(
        ES %in% c("SMD","Tau") ~ -CI_upper, 
        ES %in% c("PEM","NAP") ~ 1 - CI_upper,
        TRUE ~ CI_lower
      ), 
      CI_U = case_when(
        ES %in% c("SMD","Tau") ~ -CI_lower, 
        ES %in% c("PEM","NAP") ~ 1 - CI_lower,
        TRUE ~ CI_upper
      )
    ) %>%
    select(-CI_lower, -CI_upper) %>%
    rename(CI_lower = CI_L, CI_upper = CI_U) %>%
    arrange(Case, ES)
  
  expect_identical(symmetric_ES_pct$Case, switch_improvement_pct$Case)
  expect_identical(symmetric_ES_pct$ES, switch_improvement_pct$ES)
  expect_equal(symmetric_ES_pct$Est, switch_improvement_pct$Est)
  expect_equal(symmetric_ES_pct$SE, switch_improvement_pct$SE)
  expect_equal(symmetric_ES_pct$CI_lower, switch_improvement_pct$CI_lower)
  expect_equal(symmetric_ES_pct$CI_upper, switch_improvement_pct$CI_upper)
  
})

test_that("For symmetric ES with percentage, flipping improvement direction and phase coding yields identical results", {
  
  switch_baseline_pct <- 
    batch_calc_ES(
      Thorne_pct, 
      grouping = Case,
      condition = "Trt",
      baseline_phase = 1,
      session_number = "Session_number",
      outcome = "Outcome",
      ES = dplyr::setdiff(symmetric_ES,"PEM"),
      std_dev = "pool",
      improvement = "decrease",
      scale = "percentage"
    ) %>%
    mutate(
      ES = recode(ES, LRRd = "LRRi", LRRi = "LRRd"),
      Est = ifelse(ES %in% c("LRRd","LRRi"), -Est, Est),
      CI_L = ifelse(ES %in% c("LRRd","LRRi"), -CI_upper, CI_lower),
      CI_U = ifelse(ES %in% c("LRRd","LRRi"), -CI_lower, CI_upper)
    ) %>%
    select(-CI_lower, -CI_upper) %>%
    rename(CI_lower = CI_L, CI_upper = CI_U) %>%
    arrange(Case, ES)
  
  symmetric_ES_pct_no_PEM <- dplyr::filter(symmetric_ES_pct, ES != "PEM")
  
  expect_identical(symmetric_ES_pct_no_PEM$Case, switch_baseline_pct$Case)
  expect_identical(symmetric_ES_pct_no_PEM$ES, switch_baseline_pct$ES)
  expect_equal(symmetric_ES_pct_no_PEM$Est, switch_baseline_pct$Est)
  expect_equal(symmetric_ES_pct_no_PEM$SE, switch_baseline_pct$SE)
  expect_equal(symmetric_ES_pct_no_PEM$CI_lower, switch_baseline_pct$CI_lower)
  expect_equal(symmetric_ES_pct_no_PEM$CI_upper, switch_baseline_pct$CI_upper)
  
})

