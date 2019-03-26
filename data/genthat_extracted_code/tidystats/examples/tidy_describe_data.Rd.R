library(tidystats)


### Name: tidy_describe_data
### Title: Convert descriptives to a tidy data frame
### Aliases: tidy_describe_data

### ** Examples

library(dplyr)

# Calculate descriptives
descriptives <- describe_data(sleep, extra)

# Create a tidy data frame of the descriptives
tidy_describe_data(descriptives)

# With a grouping variable:
sleep %>%
  group_by(group) %>%
  describe_data(extra) %>%
  tidy_describe_data()




