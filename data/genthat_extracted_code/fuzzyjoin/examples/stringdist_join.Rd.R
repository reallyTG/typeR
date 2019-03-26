library(fuzzyjoin)


### Name: stringdist_join
### Title: Join two tables based on fuzzy string matching of their columns
### Aliases: stringdist_join stringdist_inner_join stringdist_left_join
###   stringdist_right_join stringdist_full_join stringdist_semi_join
###   stringdist_anti_join

### ** Examples


library(dplyr)
library(ggplot2)
data(diamonds)

d <- data_frame(approximate_name = c("Idea", "Premiums", "Premioom",
                                     "VeryGood", "VeryGood", "Faiir"),
                type = 1:6)

# no matches when they are inner-joined:
diamonds %>%
  inner_join(d, by = c(cut = "approximate_name"))

# but we can match when they're fuzzy joined
diamonds %>%
 stringdist_inner_join(d, by = c(cut = "approximate_name"))




