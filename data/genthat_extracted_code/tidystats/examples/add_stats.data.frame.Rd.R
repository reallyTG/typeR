library(tidystats)


### Name: add_stats.data.frame
### Title: add_stats data frame function
### Aliases: add_stats.data.frame

### ** Examples


# Create an empty list to store the results in
results <- list()

# Example: Manual chi-squared test of independence
x_squared_data <- data.frame(
  statistic = c("X-squared", "df", "p"),
  value = c(5.4885, 6, 0.4828),
  method = "Chi-squared test of independence"
  )

# Add results to results
results <- add_stats(results, x_squared_data)




