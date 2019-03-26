library(tidystats)


### Name: describe_data
### Title: Calculate common descriptive statistics
### Aliases: describe_data

### ** Examples

library(dplyr)

# 1 variable
describe_data(cox, avoidance)

# 1 variable, 1 group
cox %>%
  group_by(condition) %>%
  describe_data(avoidance)

# 2 variables
describe_data(cox, avoidance, anxiety)

# 2 variables, 1 group
cox %>%
  group_by(condition) %>%
  describe_data(avoidance, anxiety)

# 1 variable, 2 groups
cox %>%
  group_by(condition, sex) %>%
  describe_data(avoidance)

# 2 variables, 2 groups
cox %>%
  group_by(condition, sex) %>%
  describe_data(avoidance, anxiety)




