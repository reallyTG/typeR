library(fuzzyjoin)


### Name: difference_join
### Title: Join two tables based on absolute difference between their
###   columns
### Aliases: difference_join difference_inner_join difference_left_join
###   difference_right_join difference_full_join difference_semi_join
###   difference_anti_join

### ** Examples


library(dplyr)

head(iris)
sepal_lengths <- data_frame(Sepal.Length = c(5, 6, 7), Type = 1:3)

iris %>%
  difference_inner_join(sepal_lengths, max_dist = .5)




