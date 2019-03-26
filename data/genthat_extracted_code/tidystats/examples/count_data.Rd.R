library(tidystats)


### Name: count_data
### Title: Count the total of observations
### Aliases: count_data

### ** Examples

library(dplyr)

# 1 variable
count_data(cox, sex)

# 2 variables
count_data(cox, condition, sex)

# 1 variable, 1 group
cox %>%
  group_by(condition) %>%
  count_data(sex)




