library(DirectStandardisation)


### Name: adjprop
### Title: Calculate adjusted proportions using direct standardisation
### Aliases: adjprop

### ** Examples

# Example 1

# generate a dataframe with sleep deprivation (binary), sex and age group
data <- data.frame("sleep_deprivation" = rbinom(50, size = 1, prob = 0.5), 
"sex" = c(rep("m", 25), rep("f", 25)), 
"age_group" = rep(c("20-29", "30-39", "40-49", "50-59", "60-69"), 5))

adjprop(dataset = data, outcome_var_name = "sleep_deprivation", 
categorical_vars = "sex", outcome_label = "Sleep deprivation", 
categorical_var_labels = list(list("Sex", c("Female", "Male"))), 
adjustment_vars = "age_group", adjustment_var_labels = "age", 
title = "Proportions of sleep deprivation by sex.")

# Example 2

# generate a dataframe with sleep duration group (3 categories), sex and age group
data <- data.frame("sleep_group" = rbinom(500, size = 2, prob = 0.3), 
"sex" = c(rep("m", 25), rep("f", 25)), 
"age_group" = rep(c("20-29", "30-39", "40-49", "50-59", "60-69"), 5))

adjprop(dataset = data, outcome_var_name = "sleep_group", 
categorical_vars = "sex", outcome_label = "Sleep duration group", 
outcome_categories_labels = c("Group 1", "Group 2", "Group 3"),
categorical_var_labels = list(list("Sex", c("Female", "Male"))), 
adjustment_vars = "age_group", adjustment_var_labels = "age", 
title = "Proportions of sleep duration groups by sex.")

# Example 3

# generate a dataframe with sleep duration group (3 categories), sex and age group
data <- data.frame("sleep_group" = rbinom(500, size = 2, prob = 0.3), 
"sex" = c(rep("m", 25), rep("f", 25)), 
"age_group" = rep(c("20-29", "30-39", "40-49", "50-59", "60-69"), 5))

# no labels, more digits
adjprop(dataset = data, outcome_var_name = "sleep_group", 
categorical_vars = "sex", adjustment_vars = "age_group", 
adjustment_var_labels = "age", ndigits = 4, 
title = "Proportions of sleep duration groups by sex.")

# Example 4

# generate a dataframe with sleep duration group (4 categories), sex and age group
data <- data.frame("sleep_group" = rbinom(500, size = 3, prob = 0.25), 
"sex" = c(rep("m", 25), rep("f", 25)), 
"age_group" = rep(c("20-29", "30-39", "40-49", "50-59", "60-69"), 5))

# no labels, proportions
adjprop(dataset = data, outcome_var_name = "sleep_group", 
categorical_vars = "sex", adjustment_vars = "age_group", 
adjustment_var_labels = "age", title = "Proportions of sleep duration groups by sex.")

# no labels, percentages
adjprop(dataset = data, outcome_var_name = "sleep_group", 
categorical_vars = "sex", adjustment_vars = "age_group", 
adjustment_var_labels = "age", percentage = TRUE, 
title = "Proportions of sleep duration groups by sex.")



