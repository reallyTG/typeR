## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(cusum)

## ------------------------------------------------------------------------
data("cusum_example_data", package = "cusum")

head(cusum_example_data)

## ------------------------------------------------------------------------
data("racusum_example_data", package = "cusum")

head(racusum_example_data)

## ------------------------------------------------------------------------
cusum_example_p1 <- cusum_example_data[cusum_example_data$year == 2016, ]
cusum_example_p2 <- cusum_example_data[cusum_example_data$year == 2017, ]

racusum_example_p1 <- racusum_example_data[racusum_example_data$year == 2016, ]
racusum_example_p2 <- racusum_example_data[racusum_example_data$year == 2017, ]

## ------------------------------------------------------------------------
failure_probability <- mean(cusum_example_p1$y)

n_patients <- nrow(cusum_example_p1)

## ------------------------------------------------------------------------

cusum_limit <- cusum_limit_sim(failure_probability,
                            n_patients,
                            odds_multiplier = 2,
                            n_simulation = 1000,
                            alpha = 0.05,
                            seed = 2046)


print(cusum_limit)

## ------------------------------------------------------------------------
patient_outcomes <- cusum_example_p2$y


cusum_cs <- cusum(
  failure_probability,
  patient_outcomes,
  limit = cusum_limit,
  odds_multiplier = 2,
  reset = FALSE)
  
head(cusum_cs)

## ------------------------------------------------------------------------
cusum_cs <- cusum(
  failure_probability,
  patient_outcomes,
  limit = cusum_limit,
  odds_multiplier = 2,
  reset = TRUE)
  
head(cusum_cs)

## ------------------------------------------------------------------------
n_patients <- nrow(cusum_example_p2)

cusum_alpha <- cusum_alpha_sim(
  failure_probability,
  n_patients,
  odds_multiplier = 2,
  n_simulation = 1000,
  limit = cusum_limit,
  seed = 2046
)

print(cusum_alpha)

## ------------------------------------------------------------------------

patient_risks <- racusum_example_p1$score

racusum_limit <- racusum_limit_sim(patient_risks,
                                   odds_multiplier = 2,
                                   n_simulation = 1000,
                                   alpha = 0.05,
                                   seed = 2046)
  
print(racusum_limit)

## ------------------------------------------------------------------------
patient_risks <- racusum_example_p2$score 

patient_outcomes <- racusum_example_p2$y

racusum_cs <- racusum(patient_risks,
                      patient_outcomes,
                      limit = racusum_limit,
                      odds_multiplier = 2,
                      reset = FALSE)

head(racusum_cs)

## ------------------------------------------------------------------------

racusum_cs <- racusum(patient_risks,
                      patient_outcomes,
                      limit = racusum_limit,
                      odds_multiplier = 2,
                      reset = TRUE)

head(racusum_cs)

## ------------------------------------------------------------------------
racusum_alpha <- racusum_alpha_sim(
  patient_risks,
  odds_multiplier = 2,
  n_simulation = 1000,
  limit = racusum_limit,
  seed = 2046
)

print(racusum_alpha)

