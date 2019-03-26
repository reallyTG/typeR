library(fuzzyjoin)


### Name: distance_join
### Title: Join two tables based on a distance metric of one or more
###   columns
### Aliases: distance_join distance_inner_join distance_left_join
###   distance_right_join distance_full_join distance_semi_join
###   distance_anti_join

### ** Examples


library(dplyr)

head(iris)
sepal_lengths <- data_frame(Sepal.Length = c(5, 6, 7),
                            Sepal.Width = 1:3)

iris %>%
  distance_inner_join(sepal_lengths, max_dist = 2)




