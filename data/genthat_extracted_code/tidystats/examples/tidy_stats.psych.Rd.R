library(tidystats)


### Name: tidy_stats.psych
### Title: tidy_stats method for psych's alpha objects
### Aliases: tidy_stats.psych

### ** Examples

# Load packages
library(psych)
library(dplyr)

# Create an empty list to store results in
results <- list()

# Example: Cronbach's alpha
alpha_agreeableness <- bfi %>%
  select(A1, A2, A3, A4, A5) %>%
  alpha(check.keys = TRUE, warnings = FALSE)

# Tidy stats
tidy_stats(alpha_agreeableness)

# Example: Correlations
cors_agreeableness <- bfi %>%
  select(A1, A2, A3, A4, A5) %>%
  corr.test()

# Tidy stats
tidy_stats(cors_agreeableness)




