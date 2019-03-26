library(fuzzyjoin)


### Name: regex_join
### Title: Join two tables based on a regular expression in one column
###   matching the other
### Aliases: regex_join regex_inner_join regex_left_join regex_right_join
###   regex_full_join regex_semi_join regex_anti_join

### ** Examples


library(dplyr)
library(ggplot2)
data(diamonds)

diamonds <- tbl_df(diamonds)

d <- data_frame(regex_name = c("^Idea", "mium", "Good"),
                type = 1:3)

# When they are inner_joined, only Good<->Good matches
diamonds %>%
  inner_join(d, by = c(cut = "regex_name"))

# but we can regex match them
diamonds %>%
 regex_inner_join(d, by = c(cut = "regex_name"))




