library(widyr)


### Name: pairwise_count
### Title: Count pairs of items within a group
### Aliases: pairwise_count pairwise_count_

### ** Examples


library(dplyr)
dat <- data_frame(group = rep(1:5, each = 2),
                  letter = c("a", "b",
                             "a", "c",
                             "a", "c",
                             "b", "e",
                             "b", "f"))

# count the number of times two letters appear together
pairwise_count(dat, letter, group)
pairwise_count(dat, letter, group, sort = TRUE)
pairwise_count(dat, letter, group, sort = TRUE, diag = TRUE)




