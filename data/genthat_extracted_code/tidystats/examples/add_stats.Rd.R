library(tidystats)


### Name: add_stats
### Title: Add statistical output to a tidy stats list
### Aliases: add_stats

### ** Examples

# Create an empty list to store the results in
results <- list()

# Example: t-test
model_t_test <- t.test(extra ~ group, data = sleep)
results <- add_stats(results, model_t_test, identifier = "t_test")

# Example: correlation
x <- c(44.4, 45.9, 41.9, 53.3, 44.7, 44.1, 50.7, 45.2, 60.1)
y <- c( 2.6,  3.1,  2.5,  5.0,  3.6,  4.0,  5.2,  2.8,  3.8)

model_correlation <- cor.test(x, y)

# Add output to the results list, only storing the correlation and p-value
results <- add_stats(results, model_correlation, identifier = "correlation")

# Example: Regression
ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2, 10, 20, labels = c("Ctl","Trt"))
weight <- c(ctl, trt)

model_lm <- lm(weight ~ group)

# Add output to the results list, with notes
results <- add_stats(results, model_lm, identifier = "regression", notes =
"regression example")

# Example: ANOVA
model_aov <- aov(yield ~ block + N * P * K, npk)

results <- add_stats(results, model_aov, identifier = "ANOVA")

# Example: Within-subjects ANOVA
model_aov_within <- aov(extra ~ group + Error(ID/group), data = sleep)

results <- add_stats(results, model_aov_within, identifier = "ANOVA_within")

# Example: Manual chi-squared test of independence
library(tibble)

x_squared_data <- tibble(
  statistic = c("X-squared", "df", "p"),
  value = c(5.4885, 6, 0.4828),
  method = "Chi-squared test of independence"
)

results <- add_stats(results, x_squared_data, identifier = "x_squared")




