library(DirectStandardisation)


### Name: adjmeans
### Title: Calculate adjusted means using direct standardisation
### Aliases: adjmeans

### ** Examples

# Example 1

# generate a dataframe with sleep duration, sex and age group
data <- data.frame("sleep" = rnorm(50, mean = 8, sd = 1.5), 
"sex" = c(rep("m", 25), rep("f", 25)), 
"age_group" = rep(c("20-29", "30-39", "40-49", "50-59", "60-69"), 5))

adjmeans(dataset = data, outcome_var_name = "sleep", 
categorical_vars = "sex", outcome_label = "Sleep duration", 
categorical_var_labels = list(list("Sex", c("Female", "Male"))), 
adjustment_vars = "age_group", adjustment_var_labels = "age", 
title = "Means of sleep duration by sex.")

# Example 2

# generate a dataframe with sleep duration, sex and age group
data <- data.frame("sleep" = rnorm(50, mean = 8, sd = 1.5), 
"sex" = c(rep("m", 25), rep("f", 25)), 
"age_group" = rep(c("20-29", "30-39", "40-49", "50-59", "60-69"), 5))

# no labels, more digits
adjmeans(dataset = data, outcome_var_name = "sleep", 
categorical_vars = "sex", adjustment_vars = "age_group", 
ndigits = 4, title = "Means of sleep duration by sex.")



