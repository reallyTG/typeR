context("Pustejovsky (2018) examples.")

library(tidyr)
library(dplyr)

#----------------------------------
# McKissick (2010) example
#----------------------------------

# calculate summary statistics and effect sizes 
data("McKissick")

McKissick_summary <- 
  McKissick %>%
  group_by(Case_pseudonym, Condition) %>%
  summarise(
    M = mean(Outcome), 
    S = sd(Outcome),
    n = n(),
    BC = log(M) + S^2 / (2 * n * M^2),
    V = S^2 / (n * M^2)
  ) %>%
  gather("stat","val", M:V) %>%
  unite(stat, stat, Condition) %>%
  spread(stat, val) %>%
  mutate(
    R_1 = log(M_B) - log(M_A),
    R_2 = BC_B - BC_A,
    SE_R = sqrt(V_A + V_B)
  ) 

McKissick_R1 <- 
  McKissick %>%
  group_by(Case_pseudonym) %>%
  do(LRRd(condition = .$Condition, outcome = .$Outcome, 
         scale = "count", observation_length = 20, bias_correct = FALSE))

McKissick_R2 <- 
  McKissick %>%
  group_by(Case_pseudonym) %>%
  do(LRRd(condition = .$Condition, outcome = .$Outcome, 
          scale = "count", observation_length = 20))

McKissick_R1_batch <- 
  batch_calc_ES(McKissick,
                grouping = Case_pseudonym,
                condition = Condition,
                outcome = Outcome,
                ES = "LRRd",
                improvement = "decrease",
                scale = "count",
                observation_length = 20,
                bias_correct = FALSE)

McKissick_R2_batch <- 
  batch_calc_ES(McKissick,
                grouping = Case_pseudonym,
                condition = Condition,
                outcome = Outcome,
                ES = "LRRd",
                improvement = "decrease",
                scale = "count",
                observation_length = 20)

test_that("LRRd is correct with McKissick counts.", {
  
  expect_equal(McKissick_summary$R_1, McKissick_R1$Est)
  expect_equal(McKissick_summary$R_2, McKissick_R2$Est)
  expect_equal(McKissick_summary$SE_R, McKissick_R1$SE)
  expect_equal(McKissick_summary$SE_R, McKissick_R2$SE)
  
  expect_identical(ungroup(McKissick_R1), McKissick_R1_batch)
  expect_identical(ungroup(McKissick_R2), McKissick_R2_batch)
})


#----------------------------------
# Schmidt (2007) example
#----------------------------------

data("Schmidt2007")

# Calculate effect sizes

Schmidt_LRR <- 
  Schmidt2007 %>%
  group_by(Behavior_type, Case_pseudonym, Phase) %>%
  summarise(M = mean(Outcome),
            S = sd(Outcome),
            n = n(),
            BC_i = log(M) + S^2 / (2 * n * M^2),
            BC_d = log(100 - M) + S^2 / (2 * n * (100 - M)^2),
            V_i = S^2 / (n * M^2),
            V_d = S^2 / (n * (100 - M)^2)) %>%
  mutate(pair = substr(Phase, 2, 2),
         phase = substr(Phase, 1, 1)) %>% 
  select(Outcome = Behavior_type, Case = Case_pseudonym, pair, phase, starts_with("BC_"), starts_with("V_")) %>%
  gather("stat","val", starts_with("BC_"), starts_with("V_")) %>%
  unite(stat, stat, phase) %>%
  spread(stat, val) %>%
  mutate(R_2_i = ifelse(Outcome == "Disruptive Behavior", BC_i_A - BC_i_B, BC_i_B - BC_i_A), 
         V_R_i = V_i_A + V_i_B,
         R_2_d = ifelse(Outcome == "Disruptive Behavior", BC_i_B - BC_i_A, BC_d_B - BC_d_A), 
         V_R_d = ifelse(Outcome == "Disruptive Behavior", V_i_A + V_i_B, V_d_A + V_d_B)) %>%
  select(Outcome, Case, pair, starts_with("R_2"), starts_with("V_R"))

Schmidt_ES_calc <- 
  Schmidt2007 %>%
  group_by(Behavior_type, Case_pseudonym, Phase_num) %>%
  do(calc_ES(condition = .$Condition, 
             outcome = .$Outcome, 
             ES = c("LRRi","LRRd"),
             improvement = .$direction,
             scale = .$Metric, 
             bias_correct = TRUE,
             confidence = NULL, 
             format = "wide")
  )


test_that("LRRd and LRRi are correct with Schmidt (2007) data.", {
  
  expect_equal(Schmidt_LRR$R_2_i, Schmidt_ES_calc$LRRi_Est)
  expect_equal(sqrt(Schmidt_LRR$V_R_i), Schmidt_ES_calc$LRRi_SE)
  expect_equal(Schmidt_LRR$R_2_d, Schmidt_ES_calc$LRRd_Est)
  expect_equal(sqrt(Schmidt_LRR$V_R_d), Schmidt_ES_calc$LRRd_SE)
  
})

Schmidt_batch_ES_calc <- 
  batch_calc_ES(dat = Schmidt2007,
                grouping = vars(Behavior_type, Case_pseudonym, Phase_num),
                condition = Condition,
                outcome = Outcome,
                ES = c("LRRi","LRRd"),
                improvement = direction,
                scale = Metric,
                bias_correct = TRUE,
                confidence = NULL,
                format = "wide")


test_that("batch_calc_ES() works with Schmidt (2007) data.", {

  expect_identical(ungroup(Schmidt_ES_calc), Schmidt_batch_ES_calc)

})
