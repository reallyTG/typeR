library(dplyr)


### Name: ranking
### Title: Windowed rank functions.
### Aliases: ranking row_number ntile min_rank dense_rank percent_rank
###   cume_dist

### ** Examples

x <- c(5, 1, 3, 2, 2, NA)
row_number(x)
min_rank(x)
dense_rank(x)
percent_rank(x)
cume_dist(x)

ntile(x, 2)
ntile(runif(100), 10)

# row_number can be used with single table verbs without specifying x
# (for data frames and databases that support windowing)
mutate(mtcars, row_number() == 1L)
mtcars %>% filter(between(row_number(), 1, 10))



