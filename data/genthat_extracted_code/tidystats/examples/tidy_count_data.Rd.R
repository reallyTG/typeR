library(tidystats)


### Name: tidy_count_data
### Title: Convert count data to a tidy data frame
### Aliases: tidy_count_data

### ** Examples

library(dplyr)

# Calculate counts
condition_n <- count_data(cox, condition)

# Create a tidy data frame of the count data
tidy_count_data(condition_n)

# With a grouping variable:
cox %>%
  group_by(sex) %>%
  count_data(condition) %>%
  tidy_count_data()




