## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(SimplifyStats)

# Generate data.
set.seed(8)
df <- iris

# Modify df to demonstrate additional functionality.
## Add an NA.
df$Sepal.Length[1] <- NA
## Add another grouping variable.
df$Condition <- sample(c("untreated","treated"), nrow(df), replace = TRUE)

# Generate descriptive statistics.
group_summarize(
  df, 
  group_cols = c("Species","Condition"), 
  var_cols = c("Sepal.Length","Sepal.Width"), 
  na.rm = TRUE
)

## ------------------------------------------------------------------------
# Generate descriptive statistics.
pairwise_stats(
  df, 
  group_cols = c("Species","Condition"), 
  var_col = "Sepal.Length", 
  t.test
)

